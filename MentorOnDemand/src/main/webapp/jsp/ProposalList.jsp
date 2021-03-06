<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@page import="java.util.*"%>
<%@page import="com.MentorOnDemand.model.*"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="Style/StockStyle.css">
<link rel="stylesheet" type="text/css" href="Style/style.css">
<script src="Script/script.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="topnav" id="myTopnav">

		<a href="notification">Notifications</a> <a href="#contact">Current
			Trainings</a> <a href="#about">Completed Trainings</a> <a href="#home">EditSkills</a>
		<a href="#"><h5 class="pull-left login-person-head">
				Welcome
				<%=session.getAttribute("name")%>
			</h5></a> <a href="logout"><button class="btn-primary">Logout</button></a> <a
			href="javascript:void(0);" class="icon" onclick="myFunction()"> <i
			class="fa fa-bars"></i>
		</a>
	</div>
	<div id="content">

		<h4 align="center">Notifications</h4>
		<br>

		<%
			List proposalList = (List) request.getAttribute("notificationList");

			long orgId = (Long) session.getAttribute("name");
		%>

		<table class="table table-bordered" align="center">

			<tbody>
				<tr>
					<th class="text-center">UserId</th>
					<th>Accept</th>
					<th>Reject</th>

				</tr>

				<%
					for (int i = 0; i < proposalList.size(); i++) {

						ProposalRequest proposal = (ProposalRequest) proposalList.get(i);
				%>
				<%
					if (proposal.getMentorId() == orgId) {
				%>

				<tr>

					<td><%=proposal.getUserId()%></td>
					<td><a
						href="acceptTraining?userId=<%=proposal.getUserId()%>&mentorId=<%=proposal.getMentorId()%>&proposeId=<%=proposal.getProposalId()%>"
						class="btn btn-info btn-lg">Accept</a></td>
					<td><a
						href="rejectTraining?userId=<%=proposal.getUserId()%>&mentorId=<%=proposal.getMentorId()%>&proposeId=<%=proposal.getProposalId()%>"
						class="btn btn-info btn-lg">Reject</a></td>


					<!-- <td><button type="submit" class="btn btn-primary">Propose Training</button></td> -->

				</tr>
				<%
					}
				%>
				<%
					}
				%>
			</tbody>
		</table>

	</div>

</body>
</html>