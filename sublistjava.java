package Ext;
import java.io.FileInputStream;
import java.sql.*;

public class sublistjava {
    public static void main(String[] args){
     
        Connection conn;
       PreparedStatement pstmt=null;
        ResultSet res=null;
        final String JDBC_driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        final String DB_URL="jdbc:sqlserver://localhost;database=Audio_Steganography";
        
        final String USER="abc";
        final String PASSWORD="123";
     //   dbcon db=new dbcon();
	//db.con("Audio_Steganography","127.0.0.1","abc","123");
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn=DriverManager.getConnection(DB_URL,USER,PASSWORD);
            FileInputStream fi=new FileInputStream("C:\\Users\\hp1\\Desktop\\dataSet\\sublist.csv");
            int data;
            String[] arr=new String[4];
            for(int i=0;i<arr.length; i++)
                arr[i]="";
            int j=0;
            while((data=fi.read())!=-1){ 
                
                if( data==(int)'"' || data==(int)','){
                   if((char)data==','){
                    j++;
                   }        
                }
                                        
               if(data==10){
                    String sql="insert into sublist values (?,?,?,?)";
                    pstmt=conn.prepareStatement(sql);
                    pstmt.setString(1,arr[0]);
                    pstmt.setInt(2,Integer.parseInt(arr[1]));
                    pstmt.setInt(3,Integer.parseInt(arr[2]));
                    pstmt.setInt(4,Integer.parseInt(arr[3]));
                    pstmt.executeUpdate();
                    for(int i=0;i<arr.length;i++)
                        arr[i]="";
                    j=0;
                }
               if(data!=(int)'"'&& data!=(int)',' && data!=10){
                    arr[j]=arr[j]+(char)data;
                    System.out.println(arr[j]);
                }
               
                
                
              }
        }catch(Exception ex){
                        ex.printStackTrace();
              }
    }
}
