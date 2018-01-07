package abc;
import java.sql.*;
import java.io.*;
public class dbcon
{
    Connection con;
    Statement st;
    ResultSet rs;
            public void Con(String ip,String db,String usr,String psw)
             {
               try
                 {
                   String url="jdbc:sqlserver://localhost;database=Audio_Steganography";
                   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                   con=DriverManager.getConnection(url,usr,psw);
                   }catch(Exception e)
                  {
                   System.out.println(e);
                  }
             }
            public ResultSet slt(String qry)
            {
             try
               {
                  st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                  rs=st.executeQuery(qry);
                 }catch(Exception e)
                 {
                   e.printStackTrace();
                 }
            return rs;
             }
            public void insrt(String qry1)
            {
             try
               {
                  st=con.createStatement();
                  st.executeUpdate(qry1);
                 }catch(Exception e)
                 {
                   System.out.println(e);
                 }
            }
}   
