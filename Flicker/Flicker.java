/*
*****************************************************************
#
# Licensed Materials - Property of IBM
#
# (C) Copyright IBM Corp. 2019, 2020. All Rights Reserved.
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# *****************************************************************
*/

import java.time.ZonedDateTime;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;

public class Flicker {
	
	private static Long getMilli()
	{
		return ZonedDateTime.now().toInstant().toEpochMilli();
	}

	private static Long getOffset(boolean debugflag, String ntpserveraddr) throws IOException
	{
		NTPUDPClient client = new NTPUDPClient();
		
		client.setDefaultTimeout(1000);
		TimeInfo info = null;
		Long offsetValue = 0l;
		Long delayValue = 0l;
		
		try{
			client.open();
			if(debugflag)
			{
				System.out.println("client open successful");
			}
			try{
				
				InetAddress hostAddr = InetAddress.getByName(ntpserveraddr);
				if(debugflag)
				{
					System.out.println("connection to remote machine at "+ntpserveraddr + " successful");
				}
				info = client.getTime(hostAddr);
				info.computeDetails();
				offsetValue = info.getOffset();
				delayValue = info.getDelay();
			}
			catch(IOException ioe)
			{
				System.out.println("Could not connect to the remote machine at "+ ntpserveraddr);
				ioe.printStackTrace();
				System.exit(0);
			}
		}
		catch(SocketException e)
		{
			System.out.println("port 123 might be blocked");
			e.printStackTrace();
			System.exit(0);
		}
		
		client.close();
		if(debugflag)
		{
			System.out.println("client close successful");
		}
		
		return (offsetValue - Math.round(delayValue/2));
	}

	private static String getFileExtension(String fileName) {
        if(fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
        return fileName.substring(fileName.lastIndexOf(".")+1);
        else return "";
    }
	
	public static void main(String args[]) throws IOException, ParseException  {
		
		//collect offset value
		//Long offsetValue = 0l;
//		Long offsetValue = getOffset();
//		System.out.println("local time now: "+ZonedDateTime.now().toInstant().toEpochMilli());
//		System.out.println("NTP offset to global clock: "+offsetValue);
		
		String fileOutputError = "Missing filename, please use: \"java Flicker [option]\", [option]: -ntp <ipaddress> | -no_ntp [-a <filename>.json] [-debug]";
		String ntpFlagError = "Missing NTP option, please use: \"java Flicker [option]\", [option]: -ntp <ipaddress> | -no_ntp [-a <filename>.json] [-debug]";
		String ipAddressError = "Please provide the remote machine address. please use: \"java Flicker [option]\", [option]: -ntp <ipaddress> | -no_ntp [-a <filename>.json] [-debug]";

		//-ntp=<ipaddress> | -no_ntp [-a <filename>.json] [-debug]
		//parse the arguments
		int i = 0;
		String arg;
		boolean vflag = false;
		String outputfile = "";
		boolean fileflag = false;
		String jsonContext = new String("");
		boolean no_ntpflag = false;
		boolean ntpflag= false;
		Long offsetValue = 0l;
		boolean debugflag=false;
		String ntpserveraddr = "";
		
		while (i < args.length && args[i].startsWith("-")) {
            arg = args[i++];
	        if (arg.equals("-a")){
	        	vflag = true;
	            if (i < args.length){
	                outputfile = args[i++];
	                fileflag=true;
	            }
	        }
	        if (arg.equals("-ntp")){
	        	ntpflag = true;	        	
	            if (i < args.length){
	            	ntpserveraddr = args[i++];
	            }
	        }
	        if(arg.equals("-no_ntp"))
	        {
	            no_ntpflag=true;
	        }
	        if(arg.equals("-debug"))
	        {
	        	debugflag=true;
	        }
	        
//	        else{
//	        	System.err.println(outputError);
//	        	System.exit(0);
//	        }
        }
        //if none of the ntp options are given, then flag error
        if(!ntpflag && !no_ntpflag)
        {
        	System.err.println(ntpFlagError);
			System.exit(0); 
        }
		
		if(ntpflag)
		{
			if(ntpserveraddr.equals(""))
			{
				System.err.println(ipAddressError);
				System.exit(0); 
			}
			offsetValue = getOffset(debugflag,ntpserveraddr);
			System.out.println("local time now: "+ZonedDateTime.now().toInstant().toEpochMilli());
			System.out.println("NTP offset to global clock: "+offsetValue);

		}
		
		
        
        //if flag is mentioned but no filename
        if(vflag && !fileflag){
	         System.err.println(fileOutputError);
	         System.exit(0); 
        	
        }
        	
        //default file creation
        if(!vflag && !fileflag){
        	outputfile = "context_"+String.valueOf(ZonedDateTime.now().toInstant().toEpochMilli())+".json";
        	System.err.println("A filename is not specified. Creating a default file: "+outputfile);        	
        	vflag = true;
        	fileflag = true;
        }
        
        if(vflag && fileflag){
        	if(debugflag){
        		System.out.println("Entered main function");
        	}
        	String extension = getFileExtension(outputfile);
        	if(!extension.equals("json"))
        	{
        		System.err.println("Please correct the filename to provide .json extension");
        		System.exit(0);       	
        	}

	        //create an output file
	        BufferedWriter writer = null;
	        //create an empty JSON array
	        JSONArray contextL = new JSONArray();
	        File tempFile = new File(outputfile);
	    	boolean exists = tempFile.exists();
			if(exists){			
				//if file exists load it from JSON file
				JSONParser parser = new JSONParser();
				try{
					
					//if an existing file can be parsed then open it and append to it.
					Object obj = parser.parse(new FileReader(outputfile));
					if(debugflag){
		        		System.out.println("Parsed existing file");
		        	}
					contextL = (JSONArray) obj;
					jsonContext = contextL.toJSONString();
					//writer = new BufferedWriter(new FileWriter(outputfile, false));
					
				}catch(Exception obj){
					//if an existing file could not be parsed then a new output file is created.
					System.out.println("File could not be parsed. Creating a default file <context_timestamp>.json.");
					outputfile = "context_"+String.valueOf(ZonedDateTime.now().toInstant().toEpochMilli())+".json";
					//writer = new BufferedWriter(new FileWriter(outputfile, false));				
				}
			}
			//create a new sesssion
			JSONObject sessionObj = new JSONObject();
			sessionObj.put("offset", offsetValue);
			sessionObj.put("appserver", ntpserveraddr);
			JSONArray subContextL = new JSONArray();
			sessionObj.put("session", subContextL);
			contextL.add(sessionObj);
			
	        try{
				while(true){
					if(debugflag){
		        		System.out.println("Enter context collection section");
		        	}
					//TODO Auto-generated method stub
					//JSONArray contextL = new JSONArray();
					String label = new String("");
					String stop_label = new String("");
					boolean enterLabel = true;
					Long start_time =0l;
					Long stop_time = 0l;
					
					Scanner in = new Scanner(System.in);
					//collect labels or Exit
					while(enterLabel){
						System.out.println("Enter <Label> to start recording current context (type \"Exit\" to quit).");
						label = in.nextLine();
						if(label.equals("Exit")){
							break;
						}
						else{
							start_time = getMilli();
							//start_time = start_time + offsetValue;
						}
						enterLabel=false;
						
					}
					if(label.equals("Exit")){
						break;
					}
					
					//enter STOP command
					boolean stopLabel = true;
					while(stopLabel){
						System.out.println("Enter STOP to terminate the recording of the current context.");
						stop_label = in.nextLine();
						if (stop_label.equals("STOP")){
							stop_time = getMilli();
							//update stop time with offset value
							//stop_time = stop_time + offsetValue;
							stopLabel=false;
						}
						else{
							stopLabel=true;
						}
					}
					JSONObject contextObj = new JSONObject();
					contextObj.put("START", start_time);
					contextObj.put("STOP", stop_time);
					contextObj.put("LABEL", label);
					subContextL.add(contextObj);
					
					jsonContext = contextL.toJSONString();
					
					//update the file
					writer = new BufferedWriter(new FileWriter(outputfile, false));
					writer.write(jsonContext);
					if(debugflag){
		        		System.out.println("Added the context to the file");
		        	}
					writer.close();
					
					
					//update start time with offset value
					
					
					System.out.println(String.format("%-30s","LABEL")+String.format("%-20s","START")+String.format("%-20s","STOP"));
					for (int c = 0; c < subContextL.size(); c++) {
						JSONObject jsonObject = (JSONObject) subContextL.get(c);
						System.out.println(String.format("%-30s",jsonObject.get("LABEL"))+String.format("%-20s",jsonObject.get("START"))+String.format("%-20s",jsonObject.get("STOP")));
					}
				}
				
	        }catch(Exception ioe){
	        	ioe.printStackTrace();
	        }
		}
	}     
}
