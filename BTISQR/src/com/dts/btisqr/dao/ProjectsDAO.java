package com.dts.btisqr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.dts.btisqr.model.Project;
import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.LoggerManager;

public class ProjectsDAO extends AbstractDataAccessObject 
{
    Connection con;  
    
    //add new Project
    
	public void addProject(Project aProject)
	{
		boolean flag = true;
		try
		{
			int projectid = getSequenceID("Project" , "Projectid"); 
	        con = getConnection();
	        
	        PreparedStatement pst = con.prepareStatement("insert into project values(?,?,?,?,?,?)");
	        pst.setInt(1, projectid);
	        pst.setString(2, aProject.getProjectName());
	        pst.setString(3, aProject.getStartDate());
	        pst.setString(4, aProject.getEndDate());
	        pst.setString(5, aProject.getStatus());
	        pst.setString(6, aProject.getAssignedTo());
	        
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
	
	
//Update  Project
    
	public void updateProject(Project aProject)
	{
		boolean flag = true;
		try
		{
			con = getConnection();
	        
	        PreparedStatement pst = con.prepareStatement("update project set projectname=?,startdate=?,enddate=?,status=?,Assignedto=? where projectid=?");
	        
	        pst.setString(1, aProject.getProjectName());
	        pst.setString(2, aProject.getStartDate());
	        pst.setString(3, aProject.getEndDate());
	        pst.setString(4, aProject.getStatus());
	        pst.setString(5, aProject.getAssignedTo());
	        pst.setInt(6, aProject.getProjectID());
	        
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
	

//get All  Projects
    
	public CoreHash getAllProject()
	{
		boolean flag = true;
		CoreHash aCoreHash = new CoreHash();
		try
		{
			con = getConnection();
	        int projectid = 0;
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery("select * from project");
	        Project aProject = null;
	        while(rs.next())
	        {
	           aProject = new Project();
	           projectid = rs.getInt(1);
	           aProject.setProjectID(projectid);
	           aProject.setProjectName(rs.getString(2));
	           aProject.setStartDate1(rs.getDate(3));
	           aProject.setEndDate1(rs.getDate(4));
	           aProject.setStatus(rs.getString(5));
	           aProject.setAssignedTo(rs.getString(6));
	           
	           aCoreHash.put(projectid, aProject);    
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
	
	
//get Assigned  Projects
    
	public CoreHash getManagerProjects(String assignedto)
	{
		boolean flag = true;
		CoreHash aCoreHash = new CoreHash();
		try
		{
			con = getConnection();
	        int projectid = 0;
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery("select * from project where assignedto='"+assignedto+"'");
	        Project aProject = null;
	        while(rs.next())
	        {
	           aProject = new Project();
	           projectid = rs.getInt(1);
	           aProject.setProjectID(projectid);
	           aProject.setProjectName(rs.getString(2));
	           aProject.setStartDate1(rs.getDate(3));
	           aProject.setEndDate1(rs.getDate(4));
	           aProject.setStatus(rs.getString(5));
	           aProject.setAssignedTo(rs.getString(6));
	           
	           aCoreHash.put(projectid, aProject);    
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
	
//get All  Projects
    
	public Project getProjectDetails(int projectid)
	{
	    Project aProject = new Project();
		try
		{
			con = getConnection();
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery("select * from project projectid="+projectid);
	    
	        if(rs.next())
	        {
	           aProject = new Project();
	           projectid = rs.getInt(1);
	           aProject.setProjectID(projectid);
	           aProject.setProjectName(rs.getString(2));
	           aProject.setStartDate1(rs.getDate(3));
	           aProject.setEndDate1(rs.getDate(4));
	           aProject.setStatus(rs.getString(5));
	           aProject.setAssignedTo(rs.getString(6));    
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
		return aProject;
	}
	
//get All  Projects
    
	public Project deleteProject(int projectid)
	{
	    Project aProject = new Project();
		try
		{
			con = getConnection();
	        Statement st = con.createStatement();
	        st.executeUpdate("delete from project where projectid="+projectid);
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
		return aProject;
	}
	
	
	
	//Assign Project to Member
	public void assignProject(Project aProject)
	{
	   	try
	   	{
	   	   con = getConnection();
	   	   PreparedStatement pst = con.prepareStatement("insert into projectmembers values(?,?,?)");
	   	   pst.setInt(1, aProject.getProjectID());
	   	   pst.setString(2, aProject.getAssignedTo());
	   	   pst.setInt(3, 1);
	   	   
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
	
	
	
//View Project Memebers
    
	public CoreHash getProjectMembers(String manager)
	{
		boolean flag = true;
		CoreHash aCoreHash = new CoreHash();
		try
		{
			con = getConnection();
	        
	        Statement st = con.createStatement();
	        
	        ResultSet rs = st.executeQuery("select p.projectid,p.projectname,pm.member,ld.logintype " +
	        							   "from logindetails ld, projectmembers pm, project p " +
	        							   "where p.projectid=pm.projectid and pm.member=ld.loginname " +
	        							   " and p.Assignedto='"+manager+"'");
	        
	        Project aProject = null;
	        int i = 0;
	        while(rs.next())
	        {
	           aProject = new Project();
	           aProject.setProjectID(rs.getInt(1));
	           aProject.setProjectName(rs.getString(2));
	           aProject.setMemberName(rs.getString(3));
	           aProject.setRole(rs.getString(4));
	           
	           
	           aCoreHash.put(new Integer(i++), aProject);    
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
	
	
	
//get Free Members 
    
	public CoreHash getFreeMemebers(String role)
	{
		boolean flag = true;
		CoreHash aCoreHash = new CoreHash();
		try
		{
			con = getConnection();
	        
	        Statement st = con.createStatement();
	        
	        ResultSet rs = st.executeQuery("select loginname from logindetails ld where loginname not in " +
	        		                       "(select member from projectmembers) and logintype='"+role+"'");
	        
	        Project aProject = null;
	        int i = 0;
	        while(rs.next())
	        {
	           aProject = new Project();
	           
	           aProject.setMemberName(rs.getString(1));
	           
	           aCoreHash.put(new Integer(i++), aProject);    
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
	
	//get Project by Loginname
	
	public Project getProject(String loginname)
	{
		Project aProject = new Project();
		try
		{
			con = getConnection(); 
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select pm.projectid, p.projectname from projectmembers pm, project p " +
										   " where p.projectid=pm.projectid and pm.member='"+loginname+"' and pm.status=1");
			while(rs.next())
			{
				aProject.setProjectID(rs.getInt(1));
				aProject.setProjectName(rs.getString(2));
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
		return aProject;
	}
}
