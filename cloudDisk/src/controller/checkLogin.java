package controller;

import java.sql.*;
import dbutil.DBHelper;

public class checkLogin 
{
	public String checkLogin(String userName,String userPassword)throws Exception
	{
		ResultSet rs=null;
		DBHelper.createConnection();
		try
		{
			String sql="select * from userinfo where userName='"+userName+"'";
			rs=DBHelper.executeQuery(sql);
			if(rs.next())
			{
				if(rs.getString("userPassword").equals(userPassword))
				{
					return "Login Success";
				}
				else
					return "Wrong Password";
			}
			else
				return "No such user";
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
	public boolean saveToDatabase(String userName,String userPassword) throws Exception
	{
		DBHelper.createConnection();
		try
		{
			String sql="insert into userInfo values('"+userName+"','"+userPassword+"',default);";
			DBHelper.executeUpdate(sql);
			return true;			
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
