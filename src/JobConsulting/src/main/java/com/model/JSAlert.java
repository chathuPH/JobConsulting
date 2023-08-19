package com.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class JSAlert {

	public void Alert(String msg,HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
	        out.println("<script type=\"text/javascript\">");
	        out.println("alert('"+msg+"');");
	        //out.println("window.location.href = 'registration.jsp';");
	        out.println("</script>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void AlertWithReload(String msg,HttpServletResponse response,String url) {
		PrintWriter out;
		try {
			out = response.getWriter();
	        out.println("<script type=\"text/javascript\">");
	        out.println("alert('"+msg+"');");
	        out.println("window.location.href = '"+url+"';");
	        out.println("</script>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
