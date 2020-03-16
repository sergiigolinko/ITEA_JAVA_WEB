
<%
String rows1=request.getParameter("rows");
String columns1=request.getParameter("columns");
int i=Integer.parseInt(rows1);
int j=Integer.parseInt(columns1);
int g=1;

%>

<table border='1' align="center" >
<%
for(int k=0;k<i;k++){
out.write("<tr>");
	
	for(int m=0;m<j;m++){
		if(k==0||m==0||k==i-1||m==j-1){
		
		out.write("<td bgcolor=\"red\">"+g+"</td>");
		}
		else if((i*j+1)/2==g){
			out.write("<td bgcolor=\"white\">" +g+ "</td>");
			
		}
		
		else  {
            out.write("<td bgcolor=\"green\">" +g+ "</td>");
        }
		g++;
		
	}
	out.write("</tr>");
	
}
%>
</table>