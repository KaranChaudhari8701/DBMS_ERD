package collegedemo;
import java.sql.*;
import java.util.*;
public class Databaseconnects {
	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegedemos", "root", "Karan@123");
			Statement stm=con.createStatement();
			Scanner sc=new Scanner(System.in);
			int r;
			String nm;
			String addr;
			System.out.println("enter the rollno:");
			r=sc.nextInt();
			System.out.println("enter the name:");
			nm=sc.next();
			System.out.println("enter the address:");
			addr=sc.next();
			//String str = "create database collegedemos";
			//String str = "create table stud(rollno int,name varchar(20),address varchar(20))";
			String str = "insert into stud values(" + r + ", '" + nm + "', '" + addr + "')";
			stm.executeUpdate(str);
			//System.out.println("database created");
			//System.out.println("table created");
			System.out.println("value inserted");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	

}
