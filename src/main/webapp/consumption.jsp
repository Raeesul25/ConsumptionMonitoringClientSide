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
		<h1 align="center">Concept Management</h1>
		
		<!--------------------- Start of form  ------------------------------->
		<form id="formConcept" name="formConcept">
			<input id="conceptName" name="conceptName" type="text" class="form-control form-control-sm" placeholder="Concept name">
			<br> 
		
			<input id="conceptDesc" name="conceptDesc" type="text"class="form-control form-control-sm" placeholder="Concept description">
			<br> 
			
			<div class="form-row">
            	<div class="col">
                 	<input id="startDate" name="startDate" type="text" class="form-control form-control-sm" placeholder="Start date">
                    <br>
                </div>
        	    <div class="col">
                    <input id="deadline" name="deadline" type="text" class="form-control form-control-sm" placeholder="Deadline">
                    <br>
                </div>
            </div>
			
			<div class="form-row">
                <div class="col">
                    <input id="pledgeGoal" name="pledgeGoal" type="text" class="form-control form-control-sm" placeholder="PledgeGoal">
                    <br>
                </div>
                <div class="col">
                     <input id="reward" name="reward" type="text" class="form-control form-control-sm" placeholder="Reward">
                     <br>
                </div>
             </div>
			
			<input id="workUpdt" name="workUpdt" type="text"class="form-control form-control-sm" placeholder="Work Update">
			<br>
            
            <div class="form-row">
                <div class="col">
                    <select id = "researcherID" name = "researcherID" class="form-control form-control-sm">
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
                </div>
            	<div class="col">
                   <select id = "manufactID" name="manufactID" class="form-control form-control-sm">
                    	<option class="dropdown-menu">Manufacturer Name</option>
                    	<%
                    		try{
                    			Connection con = userConn.connect();
                    			Statement st = con.createStatement();
                    			String query = "select * from manufacturer";
                    			ResultSet rs = st.executeQuery(query);
                    			
                    			while(rs.next()){
                    				%>
                    				<option value="<%=rs.getString("manufacturerCode")%>"><%=rs.getString("userName") %></option>
                    				<%
                    			}
                    			con.close();
                    		}catch(Exception e){
                    			
                    		}
                    	%>
                    </select>
                    <br>
                </div>
            </div>
			<input id="btnSave" name="btnSave" type="button" value="Add Concept" class="btn btn-primary">
            <input type="hidden" id="hidConceptIDSave" name="hidConceptIDSave" value="">
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
			Concept conceptObj = new Concept();
			out.print(conceptObj.readMyConcepts());
		%>
		</div>

	</div>
	</div> 
	</div>
</body>
</html>