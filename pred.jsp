<%@page import="java.sql.*"%>
<%@page import="abc.dbcon"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<html>
    <div>
        <form action="proj.html">
        <input type="submit" value="Home"/>
           </form> 
    </div>
    </html>
<%

String ip="localhost";
String db="Audio_Steganography";
String usr="abc";
String pwd="123";

String sb=(String) session.getAttribute("sub");
String rn=(String) session.getAttribute("roll");
int sbmiin=0;


dbcon d1=new dbcon();
d1.Con(ip,db,usr,pwd);


String qry="select sub1,sub2,sub3,sub4,mk1,mk2,mk3,mk4 from dan where rollno="+rn+";";
out.println("<html><head><title>Prediction Result</title><style>"
        + ".con{background-image:url(logoKu.jpg);height:130px;margin-"
        + "bottom:8px;}.bb{background-image:url(rs.jpg);height:500px;}"
        + "</style></head><body><div class=con></div>");


ResultSet rs=d1.slt(qry);
String s1="";
int m1=0;
String s2="";
int m2=0;
String s3="";
int m3=0;
String s4="";
int m4=0;
	while(rs.next())
		{

			 s1=rs.getString("sub1");
			 s2=rs.getString("sub2");
			 s3=rs.getString("sub3");
			 s4=rs.getString("sub4");	
			

			m1=rs.getInt("mk1");
			m2=rs.getInt("mk2");
			m3=rs.getInt("mk3");
			m4=rs.getInt("mk4");
			
			int m1min=0,m2min=0,m3min=0,m4min=0;

			String qry3="select mmarks from sublist  where code='"+s1+"';";	
			ResultSet rs3=d1.slt(qry3);
			
				while(rs3.next())
				{
					m1min=rs3.getInt("mmarks");
				}
		

			qry3="select mmarks from sublist  where code='"+s2+"';"; 
                        rs3=d1.slt(qry3);

                                while(rs3.next())
                                {
                                        m2min=rs3.getInt("mmarks");
                                }

			qry3="select mmarks from sublist  where code='"+s3+"';"; 
                        rs3=d1.slt(qry3);

                                while(rs3.next())
                                {
                                        m3min=rs3.getInt("mmarks");
                                }

			qry3="select mmarks from sublist  where code='"+s4+"';"; 
                        rs3=d1.slt(qry3);

                                while(rs3.next())
                                {
                                        m4min=rs3.getInt("mmarks");
                                }

			
		double s1cp=0;
		double s1fp=0;
		
		double s2cp=0;
                double s2fp=0;

		double s3cp=0;
                double s3fp=0;

		double s4cp=0;
                double s4fp=0;




		if(!sb.equals(s1))
			{
				            	qry3="select fperc,cperc from dana  where sub='"+s1+"';";
                        			rs3=d1.slt(qry3);
                                while(rs3.next())
                                {
                                        s1cp=rs3.getFloat("cperc");
					s1fp=rs3.getFloat("fperc");
                                }
			
			}
		else
			{
				s1cp=-5;
				s1fp=100;

			}


		 if(!sb.equals(s2))
                        {
                                                qry3="select fperc,cperc from dana  where sub='"+s2+"';";
                                                rs3=d1.slt(qry3);
                                while(rs3.next())
                                {
                                        s2cp=rs3.getFloat("cperc");
                                        s2fp=rs3.getFloat("fperc");
                                }
                        
                        }
		 else
                        {
                                s2cp=-5;
                                s2fp=100;

                        }


 if(!sb.equals(s3))
                        {
                                                qry3="select fperc,cperc from dana  where sub='"+s3+"';";
                                                rs3=d1.slt(qry3);
                                while(rs3.next())
                                {
                                        s3cp=rs3.getFloat("cperc");
                                        s3fp=rs3.getFloat("fperc");
                                }
                        
                        }
 else
                        {
                                s3cp=-5;
                                s3fp=100;

                        }



 if(!sb.equals(s4))
                        {
                                                qry3="select fperc,cperc from dana  where sub='"+s4+"';";
                                                rs3=d1.slt(qry3);
                                while(rs3.next())
                                {
                                        s4cp=rs3.getFloat("cperc");
                                        s4fp=rs3.getFloat("fperc");
                                }
              
                        }
 else
                        {
                                s4cp=-5;
                                s4fp=100;

                        }


double fail=0;
	if(s1fp<s2fp)
	{

		if(s1fp<s3fp)
			{
				if(s1fp<s4fp)
					{
						fail=s1fp;
					}
			}
		else if(s3fp <s4fp)
			{
				fail=s3fp;
			}
		else
			{

				fail=s4fp;
			}
			
	}
	else if(s2fp<s3fp)
	{
		if(s2fp<s4fp)
			fail=s2fp;
		else
			fail=s4fp;


	}
	else if(s3fp<s4fp)
	{

		fail=s3fp;
	}
	else
		fail=s4fp;

	

double pass=0;

		if(s1cp>0)
			pass=s1cp;
		if(s2cp>0)
			pass=pass+s2cp;
		if(s3cp>0)
			pass=pass+s3cp;
		if(s4cp>0)
			pass=pass+s4cp;


pass=pass/3;


int chk=1;

		if(!sb.equals(s1) & m1<m1min)
			{
				chk=0;
			}
		else if(!sb.equals(s2) & m2<m2min)
			{
				chk=0;
			}
		else if(!sb.equals(s3) & m3<m3min)
			{
				chk=0;
			}
		else if(!sb.equals(s4) & m4<m4min)
			{
				chk=0;
			}
out.println("<div class=bb>");
int f=0,p=0;
f=(int)fail;
p=(int)pass;		
if(chk==0)
	out.println("<br><br><center>The Predicitive Analysis is "+f+" % for Roll No. "+rn+" of passing subject "+sb+".</center>");
else
	out.println("<br><br><center>The Predicitive Analysis is "+p+" % for Roll No. "+rn+" of passing subject "+sb+".</center>");
		

break;
		
}
try
{
String q="select distinct sub1,mk1,sub2,mk2,sub3,mk3,sub4,mk4 where rollno="+rn;
ResultSet rs1=d1.slt(qry);
int pi=0;
while(rs1.next())
{
                         s1=rs1.getString("sub1");
                         s2=rs1.getString("sub2");
                         s3=rs1.getString("sub3");
                         s4=rs1.getString("sub4");


                        m1=rs1.getInt("mk1");
                        m2=rs1.getInt("mk2");
                        m3=rs1.getInt("mk3");
                        m4=rs1.getInt("mk4");
if(sb.equals(s1))
{
pi=m1;
}
if(sb.equals(s2))
{
pi=m2;
}
if(sb.equals(s3))
{
pi=m3;
}
if(sb.equals(s4))
{
pi=m4;
}
out.println("<br><br><center>Marks scored by Roll No. "+rn+" in "+sb+" : "+pi+"</center>");
String qryy="select mmarks from sublist where code='"+sb+"';";
ResultSet rs2=d1.slt(qryy);
int mm=0;
while(rs2.next())
{
mm=rs2.getInt("mmarks");
}
out.println("<br><br><center>Marks required for passing "+sb+" : "+mm+"</center>");
out.println("</div></body></html>");
}
}catch(Exception e)
{
out.println(e);
}


%>
