package com.ibm.defaultapplication;
import javax.ejb.EJB;
import javax.ejb.Stateless;
//import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.ibm.defaultapplication.IncrementSSB;

public class IncrementAction {

    private static IncrementSSB inc = null;

    private static void createEJB() {
        try {
            inc = (IncrementSSB) new InitialContext().lookup("java:module/IncrementEJB");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public static int getTheValue() {
        if (inc == null) {
            createEJB();
        }
        if (inc != null) {
            return inc.getTheValue();
        } else {
            return 0;
        }
    }

    public static int increment() {
        if (inc == null) {
            createEJB();
        }
        if (inc != null) {
            return inc.increment();
        } else {
            return 0;
        }
    }

}
