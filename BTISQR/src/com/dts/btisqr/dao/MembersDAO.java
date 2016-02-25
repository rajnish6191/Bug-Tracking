package com.dts.btisqr.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.LoggerManager;
import com.dts.dae.model.Profile;

public class MembersDAO extends AbstractDataAccessObject 
{
    Connection con;	
	 public CoreHash getProfiles(String role)
	 {
		 CoreHash aCoreHash = new CoreHash();
		 try
		 {
			 String loginname = "";
			 Profile profile = null;
			 con = getConnection();
			 Statement st = con.createStatement();
			 ResultSet rs = st.executeQuery("select ld.loginname,ld.firstname,ld.lastname,lp.city,lp.ContactNo,lp.birthdate,lp.hno,lp.street,lp.state,lp.country,lp.pincode,lp.email,ld.loginstatus from logindetails ld,loginprofile lp where ld.loginname=lp.loginid and ld.logintype='"+role+"'");
				while(rs.next())
				{
					  loginname = rs.getString(1);
		              profile = new Profile();
		              profile.setLoginID(loginname);
		              profile.setFirstName(rs.getString(2));
		              profile.setLastName(rs.getString(3));
		              profile.setCity(rs.getString(4));
		              profile.setPhoneNo(rs.getString(5));
		              profile.setBirthDate1(rs.getDate(6));
		              profile.setHno(rs.getString(7));
		              profile.setStreet(rs.getString(8));
		              profile.setState(rs.getString(9));
		              profile.setCountry(rs.getString(10));
		              profile.setPincode(rs.getString(11));
		              profile.setEmail(rs.getString(12));
		              profile.setStatus(rs.getInt(13));
		              
		              aCoreHash.put(loginname,profile);
				}
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
			return aCoreHash;
		}
	 
	 
	 public CoreHash getProfiles()
	 {
		 CoreHash aCoreHash = new CoreHash();
		 try
		 {
			 String loginname = "";
			 Profile profile = null;
			 con = getConnection();
			 Statement st = con.createStatement();
			 ResultSet rs = st.executeQuery("select ld.loginname,ld.firstname,ld.lastname,lp.city,lp.ContactNo," +
			 								"lp.birthdate,lp.hno,lp.street,lp.state,lp.country,lp.pincode,lp.email," +
			 								"ld.loginstatus,ld.logintype from logindetails ld,loginprofile lp where ld.loginname=lp.loginid");
				while(rs.next())
				{
					  loginname = rs.getString(1);
		              profile = new Profile();
		              profile.setLoginID(loginname);
		              profile.setFirstName(rs.getString(2));
		              profile.setLastName(rs.getString(3));
		              profile.setCity(rs.getString(4));
		              profile.setPhoneNo(rs.getString(5));
		              profile.setBirthDate1(rs.getDate(6));
		              profile.setHno(rs.getString(7));
		              profile.setStreet(rs.getString(8));
		              profile.setState(rs.getString(9));
		              profile.setCountry(rs.getString(10));
		              profile.setPincode(rs.getString(11));
		              profile.setEmail(rs.getString(12));
		              profile.setStatus(rs.getInt(13));
		              profile.setRole(rs.getString(14));
		              
		              aCoreHash.put(loginname,profile);
				}
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
			return aCoreHash;
		}
	 
	 
	 public CoreHash getProfiles(String developer,String tester)
	 {
		 CoreHash aCoreHash = new CoreHash();
		 try
		 {
			 String loginname = "";
			 Profile profile = null;
			 con = getConnection();
			 Statement st = con.createStatement();
			 ResultSet rs = st.executeQuery("select ld.loginname,ld.firstname,ld.lastname,lp.city,lp.ContactNo," +
			 								"lp.birthdate,lp.hno,lp.street,lp.state,lp.country,lp.pincode,lp.email," +
			 								"ld.loginstatus,ld.logintype from logindetails ld,loginprofile lp where ld.loginname=lp.loginid" +
			 								" and (ld.logintype='"+developer+"' or ld.logintype='"+tester+"')");
				while(rs.next())
				{
					  loginname = rs.getString(1);
		              profile = new Profile();
		              profile.setLoginID(loginname);
		              profile.setFirstName(rs.getString(2));
		              profile.setLastName(rs.getString(3));
		              profile.setCity(rs.getString(4));
		              profile.setPhoneNo(rs.getString(5));
		              profile.setBirthDate1(rs.getDate(6));
		              profile.setHno(rs.getString(7));
		              profile.setStreet(rs.getString(8));
		              profile.setState(rs.getString(9));
		              profile.setCountry(rs.getString(10));
		              profile.setPincode(rs.getString(11));
		              profile.setEmail(rs.getString(12));
		              profile.setStatus(rs.getInt(13));
		              profile.setRole(rs.getString(14));
		              
		              aCoreHash.put(loginname,profile);
				}
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
			return aCoreHash;
		}
}
