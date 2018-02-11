package controller;

import java.sql.*;
import dbutil.DBHelper;

public class checkAdmin 
{
	public String checkLogin(String adminName,String adminPassword)
	throws Exception
	{
		try
		{
			DBHelper.createConnection();
			String sql="";
			ResultSet rs=DBHelper.executeQuery(sql);
			if(rs.next())
			{
				if(rs.getString("adminPassword").equals(adminPassword))
				{
					return "Login Seuccess";
				}
				else
				{
					return "Wrong Password";
				}
			}
			else
			{
				return "No such user";
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			throw ex;
		}
		finally
		{
			DBHelper.closeConnection();
		}
	}
}
