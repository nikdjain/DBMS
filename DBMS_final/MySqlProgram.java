import java.sql.*;

public class MySqlProgram {

	public static void main(String[] args) {
		try
		{
			String url="jdbc:mysql://10.10.11.101:3306/te3233db";
			String sql="select * from employee";
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection(url,"te3233","te3233");
			
			Statement state=con.createStatement();
			ResultSet rs=state.executeQuery(sql);
			
			while(rs.next())
			{
				System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getInt(3));
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
