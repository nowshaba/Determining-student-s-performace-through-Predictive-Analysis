<%@page import="java.sql.*"%>
<%@page import="abc.*"%>
<html>
    <div>
        <form action="proj.html">
        <input type="submit" value="Home"/>
           </form> 
    </div>
    </html>
<%

ResultSet r1;

String ip="localhost";
String db="Audio_Steganography";
String usr="abc";
String pwd="123";
String qry1="select code from sublist;";

out.println("<html><head><title>Predictive Analysis</title><style>.aa{background-image:url(logoKu.jpg);height:130px;margin-bottom:8px;}.bb{height:500px;}.bb1{background-image:url(datamining.jpg);height:500px;width:40%;float:left;}.bb2{background-image:url(pd.jpg);height:500px;width:58%;float:right;}  </style><head>");
out.println("<body><div class=aa> </div><div class=bb><div class=bb1><center><form name=frm1 method=post action=sv3.jsp>");

dbcon d1=new dbcon();
 		try
              	{
	
		d1.Con(ip,db,usr,pwd);
		r1=d1.slt(qry1);
                 out.println("<br><br><br><br><br><br><br><br><br><br><br><font "
                         + "color=FFFFFF><strong>Choose Subject:&nbsp;</strong></font><select "
                         + "style=width:100px;height:30px; name=s1>");
	         	while(r1.next())
			{
			String sto=r1.getString("code");
			out.println("<option>"+sto+"</option>");
			}
		out.println("</select>");
              	}
           	catch(Exception e)
             	{
		out.println(e);
             	}

out.println("<br>");


out.println("<br><font color=FFFFFF><strong>Enter Roll No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></font><textarea name=rn style=height:30px;width:100px;></textarea>");
out.println("<br><br>");
out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit style=height:30px;width:100px; value=Submit>");
out.println("</form></center></div>");
out.println("<div class=bb2>");
try
{
String q1="select * from sub;";
ResultSet rs9=d1.slt(q1);
int i=0;
out.println("<center><table style=width:100%;><br><br><br><br><br><br><br><br><br>");
while(rs9.next())
{
String c=rs9.getString("code");
String s=rs9.getString("sub");
if(i==0 || i==4 || i==8 || i==12 || i==16 || i==20 || i==24)
{
//out.println(i);
out.println("<tr><td>"+c+"</td><td>"+s+"</td>");
i++;
}
else if(i==3 || i==7 || i==11 || i==15 || i==19 ||i==23)
{
out.println("</tr>");
i++;
}
else
{
out.println("<td>"+c+"</td><td>"+s+"</td>");
i++;
}

}
out.println("</table></center></div>");
out.println("</div></body></html>");

}catch(Exception e)
{
out.println(e);
}

%>
