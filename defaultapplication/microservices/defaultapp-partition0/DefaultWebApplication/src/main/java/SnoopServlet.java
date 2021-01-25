

import com.ibm.cardinal.util.*;/*
 * @(#)SnoopServlet.java        1.00 99/03/15
 * 
 * Copyright (c) 1999, 2005 International Business Machines. All Rights Reserved.
 * 
 * This software is the confidential and proprietary information of IBM.
 * You shall not disclose such Confidential Information and shall use it
 * only in accordance with the terms of the license agreement you entered
 * into with IBM.
 * 
 * IBM MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF THE
 * SOFTWARE, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE, OR NON-INFRINGEMENT. IBM SHALL NOT BE LIABLE FOR ANY DAMAGES
 * SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR DISTRIBUTING
 * THIS SOFTWARE OR ITS DERIVATIVES.
 * 
 * CopyrightVersion 1.0
 *
 *
 */

import java.io.*;
import java.util.*;
import java.security.cert.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


/**
 * Snoop Servlet returns information about the request. This servlet is 
 * useful for checking the request parameters from a particular client.
 * SnoopServlet also returns information of existing sessions, application
 * attributes, and request attributes.
 *
 *      1.0
 */


public class SnoopServlet extends HttpServlet 
{
        public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
        {
		throw new CardinalException("ERROR: dummy function called at DefaultWebApplication/src/main/java/SnoopServlet.java:SnoopServlet:doGet");
    }

        private void print (PrintWriter out, String name, String value)
        {
		throw new CardinalException("ERROR: dummy function called at DefaultWebApplication/src/main/java/SnoopServlet.java:SnoopServlet:print [overloaded_#001]");
    }

        private void print (PrintWriter out, String name, int value)
        {
		throw new CardinalException("ERROR: dummy function called at DefaultWebApplication/src/main/java/SnoopServlet.java:SnoopServlet:print [overloaded_#002]");
    }


        private String escapeChar(String str) {
		throw new CardinalException("ERROR: dummy function called at DefaultWebApplication/src/main/java/SnoopServlet.java:SnoopServlet:escapeChar");
    }
}

