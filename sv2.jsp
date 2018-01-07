<%@page import="java.sql.*"%>
<%@page import="abc.dbcon"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%

        String ip="localhost";
        String db="Audio_Steganography";
        String usr="abc";
        String pwd="123";

        String sb1=request.getParameter("s1");
        String sb2=request.getParameter("s2");
        
        dbcon d1=new dbcon();
       
        d1.Con(ip,db,usr,pwd);
        String qwr="delete from map;";
        d1.insrt(qwr);
        qwr="delete from smap;";
        d1.insrt(qwr);
        qwr="insert into smap values('"+sb1+"','"+sb2+"')";
        d1.insrt(qwr);

        String qry2="select sub1,mk1a,mk1b,sub2,mk2a,mk2b,sub3,"
                + "mk3a,mk3b,sub4,mk4a,mk4b from demo where"
                + " (sub1='"+sb1+"' OR sub2='"+sb1+"' OR sub3='"+sb1+"' OR"
                + " sub4='"+sb1+"') AND (sub1='"+sb2+"' OR sub2='"+sb2+"' OR sub3='"+sb2+"'"
                + " OR sub4='"+sb2+"');";
      //  out.println(qry2);
ResultSet rs;
        try
        { 
                  rs=d1.slt(qry2);
          //      out.println(rs.getObject("sub1"));
           while(rs.next())
                {
                //    out.println("abc");
                        String s1=rs.getString("sub1");
                        String s2=rs.getString("sub2");
                        String s3=rs.getString("sub3");
                        String s4=rs.getString("sub4");
//out.println(s1+s2+s3+s4);
        //out.println("<br>"+s1+s2+s3+s4);
                        int m1=0;
                        int m2=0;
                        String sbj1="";
                        String sbj2="";

                        int m1a=rs.getInt("mk1a");
                        int m1b=rs.getInt("mk1b");

                        int m2a=rs.getInt("mk2a");
                        int m2b=rs.getInt("mk2b");

                        int m3a=rs.getInt("mk3a");
                        int m3b=rs.getInt("mk3b");

                        int m4a=rs.getInt("mk4a");
                        int m4b=rs.getInt("mk4b");

                     if(s1.equals(sb1))
                        {
                                sbj1=sb1;
                                m1=m1a+m1b;

                        }
                       if(s1.equals(sb2))
                        {

                                sbj2=sb2;
                                m2=m1a+m1b;
                        }
                       if(s2.equals(sb1))
                        {
                                sbj1=sb1;
                                m1=m2a+m2b;


                        }
                      if(s2.equals(sb2))
                        {

                                sbj2=sb2;
                                m2=m2a+m2b;

                        }
                        if(s3.equals(sb1))
                        {
                                sbj1=sb1;
                                m1=m3a+m3b;


                        }
                      if(s3.equals(sb2))
                        {

                                sbj2=sb2;
                                m2=m3a+m3b;
                        }
                        if(s4.equals(sb1))
                        {
                                sbj1=sb1;
                                m1=m4a+m4b;

                        }
                       if(s4.equals(sb2))
                        {

                                sbj2=sb2;
                                m2=m4a+m4b;
                        }
           String fqry="insert into map values('"+sbj1+"',"+m1+",'"+sbj2+"',"+m2+");";
        d1.insrt(fqry);
                }
        }
        catch(Exception e)
        {

                out.println(e);

        }

        //		out.println("<br>"+sbj1+m1);
        //		out.println(sbj2+m2);
        //	out.println("<br>");

       
        //out.println("<br>"+fqry);

        /*
        try
        {
        //Runtime.getRuntime().exec("/home/nowshaba/prgs2/fin.py");
        //Runtime.getRuntime().exec("/home/nowshaba/apache-tomcat-7.0.75/webapps/sublist/a.sh");
        FileInputStream in=new FileInputStream("/home/hrashid/prgs2/myfig.jpg");
        FileOutputStream fs2=new FileOutputStream("/home/hrashid/apache-tomcat-8.0.24/webapps/sublist/myfig.jpg");
        int avl=in.available();

                for(int i=0;i<avl;i++)
                   {

                       int a=in.read();
                       fs2.write(a);
                      // out.println(a);

                   }    





        }

        catch(Exception e)
        {
        out.println(e);
        }*/
        //out.println("<html><img src=myfig.jpg width=500 height=500></html>");
        //this.sleep(1000);
        response.sendRedirect("proj.html");
%>
