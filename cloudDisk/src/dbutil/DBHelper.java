package dbutil;
import java.sql.*;
public class DBHelper {
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/Cloud", user = "root", pwd = "1234";
	private static Connection conn=null;
	static{
		try{
		  Class.forName(driver);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	public static void createConnection() {
		try{
		 conn = DriverManager.getConnection(url, user, pwd);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	public static void closeConnection() {
		try{
		 conn = DriverManager.getConnection(url, user, pwd);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	public static int executeUpdate(String sql){
		int r=0;
		try{
			createConnection();
			Statement cmd = conn.createStatement();
			r=cmd.executeUpdate(sql);//返回影响行数
			closeConnection();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return r;
	}
	public static ResultSet executeQuery(String sql){
		ResultSet rs=null;
		try{
			createConnection();
			Statement cmd = conn.createStatement();
			rs=cmd.executeQuery(sql);//返回影响行数
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
}
