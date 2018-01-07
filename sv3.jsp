<%@page import="java.sql.*"%>
<%@page import="abc.dbcon"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>




<%

String ip="localhost";
String db="Audio_Steganography";
String usr="abc";
String pwd="123";

String sb=request.getParameter("s1");
String rn=request.getParameter("rn");


session.setAttribute("sub",sb);
session.setAttribute("roll",rn);


dbcon d1=new dbcon();
d1.Con(ip,db,usr,pwd);
int rn1;
rn1=Integer.parseInt(rn);

out.println("<html><head><title>Error</title><style>.con{background-image:url(logoKu.jpg);height:130px;}.top{background-image:url(rs.jpg);height:500px;} </style><head><body><div class=con></div><div class=top>");
int i=0;
int j=0;
String a2="select distinct rollno from demo;";
ResultSet r2=d1.slt(a2);
while(r2.next())
{
    int r=r2.getInt("rollno");
    if(r==rn1)
    {
    j=1;
    break;
    }
}

if(j==0)
{
out.println("<br><br><center>The entered Roll No "+rn+" does not exist.</center>");
}
else
{
    String a1="select distinct sub1,sub2,sub3,sub4 from demo where rollno="+rn+";";
    ResultSet r1=d1.slt(a1);
    while(r1.next())
    {
    String s11=r1.getString("sub1");
    String s22=r1.getString("sub2");
    String s33=r1.getString("sub3");
    String s44=r1.getString("sub4");

    if(s11.equals(sb) || s22.equals(sb) || s33.equals(sb) || s44.equals(sb))
    {
    i=1;
    }

    }


    if(i==0)
    {
    out.println("<br><br><center>The entered subject "+sb+" does not exist for Roll No "+rn+".</center>");
    }
    else
    {

    String qwr="delete from dan;";
    d1.insrt(qwr);

    String qry2="select distinct rollno,sub1,mk1,sub2,mk2,sub3,mk3,sub4,mk4 from demo where (sub1='"+sb+"' OR sub2='"+sb+"' OR sub3='"+sb+"' OR sub4='"+sb+"');";

    ResultSet rs=d1.slt(qry2);
            while(rs.next())
            {

                    int rol=rs.getInt("rollno");
                    String s1=rs.getString("sub1");
                    String s2=rs.getString("sub2");
                    String s3=rs.getString("sub3");
                    String s4=rs.getString("sub4");



                    int m1=rs.getInt("mk1");

                    int m2=rs.getInt("mk2");

                    int m3=rs.getInt("mk3");

                    int m4=rs.getInt("mk4");


    String iqry="insert into dan values("+rol+",'"+s1+"',"+m1+",'"+s2+"',"+m2+",'"+s3+"',"+m3+",'"+s4+"',"+m4+");";

    d1.insrt(iqry);

	}
response.sendRedirect("danlys.jsp");
}
}
out.println("</div></body></html>");
%>
