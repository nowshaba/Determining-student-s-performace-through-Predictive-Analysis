<%@page import="java.sql.*"%>
<%@page import="abc.dbcon"%>
<%@ page import="java.io.*" %>


<%
String ip="localhost";
String db="students_record";
String usr="abc";
String pwd="123";

dbcon d1=new dbcon();
d1.Con(ip,db,usr,pwd);
int ab=0;
try
{
    Runtime.getRuntime().exec("fin.py");
    FileInputStream in=new FileInputStream("myfig.png");
    FileOutputStream fs2=new FileOutputStream("myfig.png");
    int avl=in.available();

            for(int i=0;i<avl;i++)
               {
                   int a=in.read();
                   fs2.write(a);
               }
    String q="select count(sub1) from map;";
    ResultSet rs=d1.slt(q);
    while(rs.next())
    {
    ab=rs.getInt("count(sub1)");
    }
    //out.println(ab);
    }

    catch(Exception e)
    {
    out.println(e);
}


out.println("<html><head><title>Display Image</title><style>.con{background-image:url(logoKu.jpg);height:130px;}.tan{;height:500px;}.a{float:left;height:500px;width:40%;}.b{background-image:url(cg.jpg);float:right;height:500px;width:58%;}</style></head><body><div class=con></div>");
out.println("<br><div class=tan><div class=a><center><img src=myfig.png height=500 width=500></center></div>");
out.print("<div class=b><br><br><h4>&nbsp;The Chart Generated between the two subjects is given in the figure.<br><br><br><br>&nbsp;Total number of students: "+ab+"</h4></div>");
out.println("</div></body></html>");

%>
