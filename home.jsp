<%@page import="java.sql.*" %>
<%@page import="abc.*"%>
<%
ResultSet r1;
ResultSet r2;

String ip="localhost";
String db="Audio_Steganography";
String usr="abc";
String pwd="123";
String qry1="select code from sublist;";
dbcon d1=new dbcon();
out.println("<html><head><title>Chart Generation</title><style>.abc{background-image:url"
        + "(logoKu.jpg);height:130px;margin-bottom:8px;}.def{height:500px;}."
        + "t1{background-image:url(datamining.jpg);width:40%;height:500px;float:left;}"
        + ".t2{background-image:url(pd.jpg);width:58%;height:500px;float:right;}</style></head><body>");
out.println("<div class=abc> </div>");
out.println("<div class=def><div class=t1><center><form name=frm1 method=post action=sv2.jsp>");
 		try
                {
		d1.Con(ip,db,usr,pwd);
		r1=d1.slt(qry1);
        	out.println("<br><br><br><br><br><br><br><br><br><br><br><br><strong>"
                        + "<font color=#FFFFFF>Choose Subject 1:</font></strong>&nbsp;<select style=width:100px;height:30px; name=s1>");
			while(r1.next())
			{
			String sto=r1.getString("code");
			out.println("<option>"+sto+"</option>");
			}
		out.println("</select><br>");
              	}
           	catch(Exception e)
             	{
		out.println(e);
             	}

out.println("<br>");
try
                {
		//dbcon d2=new dbcon();
               // d2.Con(ip,db,usr,pwd);
                r2=d1.slt(qry1);

                
	     out.println("<strong><font color=#FFFFFF>Choose Subject 2:</font></strong>&nbsp;<select style=width:100px;height:30px; name=s2>");
                        while(r2.next())
                        {
                        String sto=r2.getString("code");
                        out.println("<option>"+sto+"</option>");
                        }
                out.println("</select><br>");
                
 }catch(Exception e)
{
        out.println(e);
}               




out.println("<br>");
out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style=width:100px;height:30px; type=submit value=Submit>");

out.println("</form>"); 
try
{
String q1="select * from sub;";
ResultSet rs9=d1.slt(q1);
int i=0;
out.println("</center></div><div class=t2><center><table style=width:100%;><br><br><br><br><br><br><br><br><br>");
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
//String sub1=request.getParameter("s1");
//session.setAttribute("s1",sub1);


//String sub2=request.getParameter("s2");
//session.setAttribute("s2",sub2);


  }
                catch(Exception e)
                {
                out.println(e);
                }



%>
