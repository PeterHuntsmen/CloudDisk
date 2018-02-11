package service;

import java.util.*;
import java.sql.*;
import java.io.*;

public class config
{
	public static String codeToString(String str) throws Exception 
	{
		String s=str;
		if(true) 
		{
			try
			{
				byte tempB[]=s.getBytes("ISO-8859-1");
				s=new String(tempB);
			}
			catch(Exception e)
			{
				s=str;
			}  
		}
		return s;
	}
}