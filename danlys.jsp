<%@page import="java.sql.*"%>
<%@page import="abc.dbcon"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
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


String sbminn="select mmarks from sublist where code ='"+sb+"';";
                        ResultSet rs15=d1.slt(sbminn);
                        while(rs15. next())
                        {
                       		sbmiin=rs15.getInt("mmarks");

			}


String qwr="delete from dana;";
d1.insrt(qwr);

String qry2="select sub1,sub2,sub3,sub4 from dan;";

ResultSet rs=d1.slt(qry2);
ResultSet rs2;
try
{
	while(rs.next())
	{

		String s1=rs.getString("sub1");
                String s2=rs.getString("sub2");
                String s3=rs.getString("sub3");
                String s4=rs.getString("sub4");

  		String qry3="select sub from dana where sub='"+s2+"';";
		rs2=d1.slt(qry3);
               int cnt=0;
	        while(rs2.next())
                {
                    cnt++;
                }
		
			if(cnt == 0)
				{
					String qry4="insert into dana(sub) value('"+s2+"');";
					d1.insrt(qry4);

				}              
		qry3="select sub from dana where sub='"+s1+"';";
		rs2=d1.slt(qry3);
		cnt=0;
	        while(rs2.next())
                {
                    cnt++;
                }
			if(cnt == 0)
				{
					String qry4="insert into dana(sub) value('"+s1+"');";
					d1.insrt(qry4);

				}              

                qry3="select sub from dana where sub='"+s3+"';";
		rs2=d1.slt(qry3);
		cnt=0;
	        while(rs2.next())
                {
                    cnt++;
                }
			if(cnt == 0)
				{
					String qry4="insert into dana(sub) value('"+s3+"');";
					d1.insrt(qry4);

				}              


		qry3="select sub from dana where sub='"+s4+"';";
		rs2=d1.slt(qry3);
		cnt=0;
	        while(rs2.next())
                {
                    cnt++;
                }
			if(cnt == 0)
				{
					String qry4="insert into dana(sub) value('"+s4+"');";
					d1.insrt(qry4);

				}   



	}


String qry5="select sub from dana;";

ResultSet rs5=d1.slt(qry5);

	while(rs5.next())
		{
			String subj=rs5.getString("sub");
			String qry6="select * from dan where sub1='"+subj+"' OR sub2='"+subj+"'"
                                + " OR sub3='"+subj+"' OR sub4='"+subj+"';";
			//out.println(qry6+"<br>");			
			ResultSet rs6=d1.slt(qry6);
			int scnt=0;
	        while(rs6.next())
                {
                    scnt++;
                }
			String qry7="update dana set total="+scnt+" where sub='"+subj+"';";
			//out.println(qry7+"<br>");
			d1.insrt(qry7);
		}


String qry8="select sub,total from dana;";

ResultSet rs8=d1.slt(qry8);

        while(rs8.next())
                {
                        String subj=rs8.getString("sub");
			double total=rs8.getInt("total");
			String smin="select mmarks from sublist where code ='"+subj+"';";
			ResultSet rs9=d1.slt(smin);
			while(rs9.next())
			{
			int min=rs9.getInt("mmarks");
String qry10="select * from dan where (sub1='"+subj+"' AND mk1>="+min+") OR (sub2='"+subj+"'"
        + " AND mk2>="+min+") OR (sub3='"+subj+"' AND mk3>="+min+") OR (sub4='"+subj+"'"
        + " AND mk4>="+min+");";
			//out.println(qry10+"<br>");D
			
			ResultSet rs10=d1.slt(qry10);
			int scnt1=0;
	        while(rs10.next())
                {
                    scnt1++;
                }
			double pass=(double)scnt1;
			double perc=(pass/total)*100;
			//out.println(perc+"<br>");
double cperc=0;
double cpass=0;
if(subj.equals(sb))
{ 

}
else
{
		String qry20="select * from dan where ((sub1='"+subj+"' AND mk1>="+min+") "
                        + " OR (sub2='"+subj+"' AND mk2>="+min+") OR (sub3='"+subj+"' "
                        + "AND mk3>="+min+") OR (sub4='"+subj+"' AND mk4>="+min+") ) AND"
                        + " ((sub1='"+sb+"' AND mk1>="+sbmiin+")  OR (sub2='"+sb+"' AND mk2>="+sbmiin+")"
                        + " OR (sub3='"+sb+"' AND mk3>="+sbmiin+") OR (sub4='"+sb+"' AND mk4>="+sbmiin+"));";
	//	out.println(qry20+"<br>");
		ResultSet rs21=d1.slt(qry20);
                        scnt1=0;
	        while(rs21.next())
                {
                    scnt1++;
                }
			cpass=(double)scnt1;
			cperc=(cpass/total)*100;
}


double fperc=0;
double fpass=0;
if(subj.equals(sb))
{

}
else
{
                String qry20="select * from dan where ((sub1='"+subj+"' AND mk1<"+min+")"
                        + "  OR (sub2='"+subj+"' AND mk2<"+min+") OR (sub3='"+subj+"' "
                        + "AND mk3<"+min+") OR (sub4='"+subj+"' AND mk4<"+min+") ) AND "
                        + "((sub1='"+sb+"' AND mk1>="+sbmiin+")  OR (sub2='"+sb+"' AND mk2>="+sbmiin+")"
                        + " OR (sub3='"+sb+"' AND mk3>="+sbmiin+") OR (sub4='"+sb+"' AND mk4>="+sbmiin+"));";
                //out.println(qry20+"<br>");
                ResultSet rs21=d1.slt(qry20);
                              scnt1=0;
	        while(rs21.next())
                {
                    scnt1++;
                }
			fpass=(double)scnt1;
                        fperc=(fpass/total)*100;
}
			String qry11="update dana set pass="+pass+","
                                + " perc="+perc+", cpass="+cpass+",cperc="+cperc+",fpass="
                                +fpass+",fperc="+fperc+" where sub='"+subj+"';";
			d1.insrt(qry11);
			}

		}
       
        }catch(Exception e)
                {
                out.println(e);
                }
response.sendRedirect("pred.jsp");
%>
