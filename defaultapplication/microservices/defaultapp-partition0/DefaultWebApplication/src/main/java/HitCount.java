

import com.ibm.cardinal.util.*;//
// 5630-A23, 5630-A22, (C) Copyright IBM Corporation, 1997, 2019
// All rights reserved. Licensed Materials Property of IBM
// Note to US Government users: Documentation related to restricted rights
// Use, duplication or disclosure is subject to restrictions set forth in GSA ADP Schedule with IBM Corp.
// This page may contain other proprietary notices and copyright information, the terms of which must be observed and followed.
//
//
import java.io.*;
import javax.annotation.*;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.transaction.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.ibm.defaultapplication.IncrementAction;


/**
 * This servlet demonstrates various methods that can be used to increment a counter. The methods are:
 *   Servlet instance variable, or
 *   Session object, or
 *   JPA
 */


public class HitCount extends HttpServlet
{
    private static final long serialVersionUID = 1L;

	
    
    
 	
    
    public void service (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
		throw new CardinalException("ERROR: dummy function called at DefaultWebApplication/src/main/java/HitCount.java:HitCount:service");
    }

    private String incrementSession(HttpServletRequest req, boolean create) {
		throw new CardinalException("ERROR: dummy function called at DefaultWebApplication/src/main/java/HitCount.java:HitCount:incrementSession");
    }

    private String getValueEJB(String lookup) {
		throw new CardinalException("ERROR: dummy function called at DefaultWebApplication/src/main/java/HitCount.java:HitCount:getValueEJB");
    }

    private String incrementEJB(String lookup) {
		throw new CardinalException("ERROR: dummy function called at DefaultWebApplication/src/main/java/HitCount.java:HitCount:incrementEJB");
    }
}

