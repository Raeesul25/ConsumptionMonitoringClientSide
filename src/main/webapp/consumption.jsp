<%@page import="recources.Consumption"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.UserDBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	
	<!-- Linking the css scripts -->
	<link rel="stylesheet" href="Views/bootstrap.min.css">
	<link rel="stylesheet" href="Views/form.css">
	
	<!-- Linking the js files -->
	<script src="Components/jquery-3.2.1.min.js"></script>
	<script src="Components/concept.js"></script>
	
</head>
<body>

	<% UserDBConnection userConn = new UserDBConnection(); %>
		
	<div class="container">
	<div class="row">
	<div class="col-12">
		<h1 align="center">Consumption Monitoring Management</h1>
		
		<!--------------------- Start of form  ------------------------------->
		<form id="formConcept" name="formConcept">
			<select id = "userID" name = "userID" class="form-control form-control-sm">
            	<option class="dropdown-menu">Researcher Name</option>
                    <%
                    	try{
                    		Connection con = userConn.connect();
                    		Statement st = con.createStatement();
                    		String query = "select * from researcher";
                    		ResultSet rs = st.executeQuery(query);
                    			
                    		while(rs.next()){
                    			%>
                    			<option value="<%=rs.getString("researcherCode")%>"><%=rs.getString("userName") %></option>
                    				<%
                    		}
                    		con.close();
                    	}catch(Exception e){
                    			
                   		}
                   	%>
            </select>
			<br> 
		
			<input id="month" name="month" type="text"class="form-control form-control-sm" placeholder="Month">
			<br> 
            
            <input id="premonreading" name="premonreading" type="text" class="form-control form-control-sm" placeholder="Previous Month Reading">
			<br> 
			
			<input id="curmonreading" name="curmonreading" type="text"class="form-control form-control-sm" placeholder="Current Month Reading">
			<br> 
            
			<input id="btnSave" name="btnSave" type="button" value="Add Consumption" class="btn btn-primary">
            <input type="hidden" id="conID" name="conID" value="">
		</form>
		<!--------------------- End of form  ------------------------------->
		
		<br>
		<!--------------------- Alerts  ------------------------------->
		<div id="alertSuccess" class="alert alert-success"></div>
		<div id="alertError" class="alert alert-danger"></div>
		<br>
		
		<!--------------------- Display concepts  ------------------------------->
		<div id="divItemsGrid">
		<%
			Consumption consumptionObj = new Consumption();
			out.print(consumptionObj.readConsumption());
		%>
		</div>

	</div>
	</div> 
	</div>
</body>
</html>