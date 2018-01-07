<%@page import="java.sql.*"%>
<%@page import="abc.dbcon"%>
<%

String ip="localhost";
String db="Audio_Steganography";
String usr="abc";
String pwd="123";




String qwr="delete from map;";


String sub1=request.getParameter("s1");
session.setAttribute("att1",sub1);


String sub2=request.getParameter("s2");
session.setAttribute("att2",sub2);



String abc=(String)session.getAttribute("att1");
String def=(String)session.getAttribute("att2");

//out.println(abc);
String qwry="insert into map values('"+abc+"','"+def+"');";


dbcon d1=new dbcon();
d1.Con(ip,db,usr,pwd);
d1.insrt(qwr);
d1.insrt(qwry);





%>
