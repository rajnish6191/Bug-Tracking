package com.dts.core.control;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dts.core.util.LoggerManager;

public class DispatchController extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	{
		String page = req.getParameter("page");
		String role = req.getParameter("role");
		String tpage = req.getParameter("tpage");
		
		try
		{
			res.sendRedirect(page+"?role="+role+"&tpage="+tpage);
		}
		catch (IOException ioe)
		{
			LoggerManager.writeLogInfo(ioe);
		}
	}
}
