package com.dts.btisqr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import com.dts.btisqr.model.Bug;
import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.DateWrapper;
import com.dts.core.util.LoggerManager;

public class BugDAO extends AbstractDataAccessObject {

	Connection con;
	
	public void addPriority(Bug bug)
	{
		try
		{
			int priorityid = getSequenceID("PRIORITY", "priorityid");
			con = getConnection();
			String name = bug.getPriorityName();
			
			PreparedStatement pst = con.prepareStatement("insert into priority values(?,?)");
			
			pst.setInt(1, priorityid);
			pst.setString(2, name);
			
			pst.executeUpdate();
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
	}
	
	
	public void updatePriority(Bug bug)
	{
		try
		{
			con = getConnection();
			int priorityid = bug.getPriorityID();
			
			String name = bug.getPriorityName();
			
			PreparedStatement pst = con.prepareStatement("update priority set prioritytype=? where priorityid=?");
			
			pst.setInt(2, priorityid);
			pst.setString(1, name);
			
			pst.executeUpdate();
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}	
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
	}
	
	
	public void deletePriority(int priorityid)
	{
		try
		{
			con = getConnection();
			
			PreparedStatement pst = con.prepareStatement("delete from priority where priorityid=?");
			
			pst.setInt(1, priorityid);
			
			pst.executeUpdate();
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
	}
	
	
	
	public void deleteBug(int bugid)
	{
		try
		{
			con = getConnection();
			
			PreparedStatement pst = con.prepareStatement("delete from bugs where bugid=?");
			
			pst.setInt(1, bugid);
			
			pst.executeUpdate();
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
	}
	
	
	
	public void addBug(Bug bug)
	{
		try
		{
			int bugid = getSequenceID("BUGS", "bugid");
			con = getConnection();
		    String name = bug.getBugName();
		    int projectid = bug.getPriorityID();
		    String raiseddate = bug.getRaisedDate();
		    String raisedby = bug.getRaisedBy();
		    int priorityid = bug.getPriorityID();
		    String desc = bug.getDescription();
		    String status = bug.getStatus();
		    
		    PreparedStatement pst = con.prepareStatement("insert into bugs values(?,?,?,?,?,?,?,?)");
		    
		    pst.setInt(1, bugid);
		    pst.setString(2, name);
		    pst.setInt(3, projectid);
		    pst.setString(4, DateWrapper.parseDate(new Date()));
		    pst.setString(5, raisedby);
		    pst.setInt(6, priorityid);
		    pst.setString(7, desc);
		    pst.setString(8, status);
		    
		    pst.executeUpdate();
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
	}
	
	
	public void updateBug(Bug bug)
	{
		try
		{
			con = getConnection();
			int bugid = bug.getBugID();
		    String name = bug.getBugName();
		    int projectid = bug.getPriorityID();
		    String raiseddate = bug.getRaisedDate();
		    String raisedby = bug.getRaisedBy();
		    int priorityid = bug.getPriorityID();
		    String desc = bug.getDescription();
		    String status = bug.getStatus();
		    
		    PreparedStatement pst = con.prepareStatement("update bugs set bugname=?,projectid=?," +
		    											 "raiseddate=?,raisedby=?,priority=?,description=?," +
		    											 "status=? where bugid=?");
		    
		    pst.setString(1, name);
		    pst.setInt(2, projectid);
		    pst.setString(3, raiseddate);
		    pst.setString(4, raisedby);
		    pst.setInt(5, priorityid);
		    pst.setString(6, desc);
		    pst.setString(7, status);
		    pst.setInt(8, bugid);
		    
		    
		    pst.executeUpdate();
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
	}
	
	
	public Bug getBugDeatails(int bugid)
	{
		Bug bug = null;
		try
		{
			con = getConnection();
			
			Statement st = con.createStatement();
		    ResultSet rs = st.executeQuery("select * from bugs where bugid="+bugid); 
		    	
		    if(rs.next())
		    {
		        	bug = new Bug();
		        	bug.setBugID(rs.getInt(1));
		        	bug.setBugName(rs.getString(2));
		        	bug.setProjectID(rs.getInt(3));
		        	bug.setRaisedDate1(rs.getDate(4));
		        	bug.setRaisedBy(rs.getString(5));
		        	bug.setPriorityID(rs.getInt(6));
		        	bug.setDescription(rs.getString(7));
		        	bug.setStatus(rs.getString(8));
		    }
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return bug;
	}
	
	
	public CoreHash getBugs()
	{
		CoreHash aCoreHash = new CoreHash();
		
		try
		{
			Bug bug = null;
			con = getConnection();
			int bugid = 0;
			Statement st = con.createStatement();
		    ResultSet rs = st.executeQuery("select * from bugs"); 
		    	
		    while(rs.next())
		    {
		        	bug = new Bug();
		        	bugid = rs.getInt(1);
		        	bug.setBugID(bugid);
		        	bug.setBugName(rs.getString(2));
		        	bug.setProjectID(rs.getInt(3));
		        	bug.setRaisedDate1(rs.getDate(4));
		        	bug.setRaisedBy(rs.getString(5));
		        	bug.setPriorityID(rs.getInt(6));
		        	bug.setDescription(rs.getString(7));
		        	bug.setStatus(rs.getString(8));
		        	
		        	aCoreHash.put(new Integer(bugid), bug);
		    }
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreHash;
	}
	
	
	public CoreHash getBugs(String bug,String priority,String project)
	{
		CoreHash aCoreHash = new CoreHash();
		
		try
		{
			String query = "select * from bugs where";
			int count =0;
			if(!bug.equals("--Select--"))
			{
				query += " bugid="+bug;
				count = 1;
			}
			if(count==1 && !project.equals("--Select--"))
			{
				query += " and projectid="+project;
			}
			else if(!project.equals("--Select--"))
			{
				query += " projectid="+project;
				count = 1;
			}
			
			if(count==1 && !priority.equals("--Select--"))
			{
				query += " and priority="+priority;
			}
			else if(!priority.equals("--Select--"))
			{
				query += " priority="+priority;
				count = 1;
			}
			
			Bug bugs = null;
			con = getConnection();
			
			Statement st = con.createStatement();
		    ResultSet rs = st.executeQuery(query); 
		    int bugid=0;	
		    while(rs.next())
		    {
		        	bugs = new Bug();
		        	bugid = rs.getInt(1);
		        	bugs.setBugID(bugid);
		        	bugs.setBugName(rs.getString(2));
		        	bugs.setProjectID(rs.getInt(3));
		        	bugs.setRaisedDate1(rs.getDate(4));
		        	bugs.setRaisedBy(rs.getString(5));
		        	bugs.setPriorityID(rs.getInt(6));
		        	bugs.setDescription(rs.getString(7));
		        	bugs.setStatus(rs.getString(8));
		        	
		        	aCoreHash.put(new Integer(bugid), bugs);
		    }
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreHash;
	}
	
	
	
	
	public CoreHash getBugs(String membername)
	{
		CoreHash aCoreHash = new CoreHash();
		
		try
		{
			Bug bug = null;
			con = getConnection();
			int bugid = 0;
			Statement st = con.createStatement();
		    ResultSet rs = st.executeQuery("select b.bugid,b.bugname,b.projectid,b.Raiseddate,b.raisedby,b.priority,b.description,b.status from bugs b,bugassigned ba where b.bugid=ba.bugid and ba.assignedto='"+membername+"'"); 
		    	
		   while(rs.next())
		    {
		        	bug = new Bug();
		        	bugid = rs.getInt(1);
		        	bug.setBugID(bugid);
		        	bug.setBugName(rs.getString(2));
		        	bug.setProjectID(rs.getInt(3));
		        	bug.setRaisedDate1(rs.getDate(4));
		        	bug.setRaisedBy(rs.getString(5));
		        	bug.setPriorityID(rs.getInt(6));
		        	bug.setDescription(rs.getString(7));
		        	bug.setStatus(rs.getString(8));
		        	
		        	aCoreHash.put(new Integer(bugid), bug);
		    }
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreHash;
	}
	
	
	
	public CoreHash getPriorities()
	{
		CoreHash aCoreHash = new CoreHash();
		
		try
		{
			Bug bug = null;
			con = getConnection();
			int priorityid = 0;
			Statement st = con.createStatement();
		    ResultSet rs = st.executeQuery("select * from Priority"); 
		    	
		    while(rs.next())
		    {
		        	bug = new Bug();
		        	priorityid = rs.getInt(1);
		        	bug.setPriorityID(priorityid);
		        	bug.setPriorityName(rs.getString(2));
		        	
		        	aCoreHash.put(new Integer(priorityid), bug);
		    }
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreHash;
	}
	
	
	
	public Bug getBugSolution(int bugid)
	{
		Bug bug = null;
		try
		{
			con = getConnection();
			
			Statement st = con.createStatement();
		    ResultSet rs = st.executeQuery("select b.bugname,b.projectid,b.raiseddate,b.raisedby,b.priority," +
		    							   "b.description,ba.assignedto,ba.assigneddate,s.solvedby,s.solveddate," +
		    							   "s.solution from bugs b,bugassigned ba, solution s where " +
		    							   "b.bugid=ba.bugid and b.bugid=s.bugid and b.bugid="+bugid); 
		    	
		    if(rs.next())
		    {
		        	bug = new Bug();
		        	bug.setBugName(rs.getString(1));
		        	bug.setProjectID(rs.getInt(2));
		        	bug.setRaisedDate1(rs.getDate(3));
		        	bug.setRaisedBy(rs.getString(4));
		        	bug.setPriorityID(rs.getInt(5));
		        	bug.setDescription(rs.getString(6));
		        	bug.setAssignedTo(rs.getString(7));
		        	bug.setAssignedDate1(rs.getDate(8));
		        	bug.setSolvedBy(rs.getString(9));
		        	bug.setSolvedDate1(rs.getDate(10));
                    bug.setSolution(rs.getString(11)); 
		    }
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return bug;
	}
	
	
	public void setBugSolution(Bug bug)
	{
		int i = 0;
		try
		{
			con = getConnection();
			con.setAutoCommit(false);
			PreparedStatement pst = con.prepareStatement("insert into solution values(?,?,?,?)");
			PreparedStatement pst1 = con.prepareStatement("update bugs set status=? where bugid=?"); 
		    
		    pst.setInt(1, bug.getBugID());
		    pst.setString(2, bug.getSolvedBy());
		    pst.setString(3, bug.getSolvedDate());
		    pst.setString(4, bug.getSolution());
		    
		    pst1.setString(1, "Completed");
	        pst1.setInt(2, bug.getBugID());
	           
	           
		    if(pst.executeUpdate()>0)
		    {
		    	if(pst1.executeUpdate()>0)
		    			i=1;
		    }
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				if(i==0)
					con.rollback();
				else
				    con.commit();
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
	}
	
	
	public void assignBug(Bug aBug)
	{
		int i=0;
		try
		{
		   con = getConnection();
           con.setAutoCommit(false);
           PreparedStatement pst = con.prepareStatement("insert into bugassigned values(?,?,?)");
           PreparedStatement pst1 = con.prepareStatement("update bugs set status=? where bugid=?");
           
           pst.setInt(1, aBug.getBugID());
           pst.setString(2, aBug.getAssignedTo());
           pst.setString(3, DateWrapper.parseDate(new Date()));
           
           pst1.setString(1, "Assigned");
           pst1.setInt(2, aBug.getBugID());
           if(pst.executeUpdate()>0)
           {
        	   if(pst1.executeUpdate()>0)
        	   {
        		   i=1;
        	   }
           }
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
			i=0;
		}
		finally
		{
			try
			{
				if(i==0)
					con.rollback();
				else
				    con.commit();
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
	}
}
