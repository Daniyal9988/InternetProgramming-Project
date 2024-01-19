<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="model.ElectricityBIll"%>
<%@ page import="model.WaterBill"%>
<%@ page import="model.RecycleBill"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@500&family=Montserrat:ital@1&family=Roboto+Mono:ital@1&family=Roboto:ital,wght@1,900&family=Rubik+Burned&family=Sora:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://localhost:8080/Project/resources/css/approvebill.css" />
</head>
<body>
	<jsp:include page="../headerfooter/header.jsp" />
	<%
		List<ElectricityBIll> electricity_list = (List<ElectricityBIll>) request.getAttribute("electricity_list");
		List<WaterBill> water_list = (List<WaterBill>) request.getAttribute("water_list");
		List<RecycleBill> recycle_list = (List<RecycleBill>) request.getAttribute("recycle_list");
	%>




	<div class="report-container">
		<div class="report-search-container">
			<input type="text" id="electricity-search-input" class="search-input"
				oninput="filterTable('electricity')"
				placeholder="Search by ID or Status">
			<div class="report-box">

				<table id="electricity">
					<thead>
						<th colspan="5">Electricity</th>
					</thead>
					<tbody>
						<%
							for (ElectricityBIll electricitybill : electricity_list) {
						%>
						<tr>
							<td><%=electricitybill.getId()%></td>
							<td><%=electricitybill.getElectricity()%></td>
							<td><%=electricitybill.getVstatus()%></td>
							<td><a href="<%=electricitybill.getBillFile()%>"
								download="electricity.pdf">Download</a></td>
							<td>
								<form
									action="http://localhost:8080/Project/admin/approveTheBills"
									method="post">
									<input type="hidden" name="email"
										value="<%=electricitybill.getEmail()%>"> <input
										type="hidden" name="id" value="<%=electricitybill.getId()%>">
									<input type="hidden" name="type" value="electricity">
									<button type="submit" value="approved" name="choice">Approve</button>
									<button type="submit" value="rejected" name="choice">Reject</button>
								</form>
							</td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</div>
		<div class="report-search-container">
			<input type="text" id="water-search-input" class="search-input"
				oninput="filterTable('water')" placeholder="Search by ID or Status">
			<div class="report-box">
				<table id="water">
					<thead>
						<th colspan="5">Water</th>
					</thead>
					<tbody>
						<%
							for (WaterBill waterbill : water_list) {
						%>
						<tr>
							<td><%=waterbill.getId()%></td>
							<td><%=waterbill.getWater()%></td>
							<td><%=waterbill.getVstatus()%></td>
							<td><a href="<%=waterbill.getBillFile()%>"
								download="water.pdf">Download</a></td>
							<td>
								<form
									action="http://localhost:8080/Project/admin/approveTheBills"
									method="post">
									<input type="hidden" name="email"
										value="<%=waterbill.getEmail()%>"> <input
										type="hidden" name="type" value="water"> <input
										type="hidden" name="id" value="<%=waterbill.getId()%>">
									<button type="submit" value="approved" name="choice">Approve</button>
									<button type="submit" value="rejected" name="choice">Reject</button>
								</form>
							</td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</div>
		<div class="report-search-container">
			<input type="text" id="recycle-search-input" class="search-input"
				oninput="filterTable('recycle')"
				placeholder="Search by ID or Status">
			<div class="report-box">
				<table id="recycle">
					<thead>
						<th colspan="5">Recycle</th>
					</thead>
					<tbody>
						<%
							for (RecycleBill recyclebill : recycle_list) {
						%>
						<tr>
							<td><%=recyclebill.getId()%></td>
							<td><%=recyclebill.getRecycle()%></td>
							<td><%=recyclebill.getVstatus()%></td>
							<td><a href="<%=recyclebill.getBillFile()%>"
								download="electricity.pdf">Download</a></td>
							<td>
								<form
									action="http://localhost:8080/Project/admin/approveTheBills"
									method="post">
									<input type="hidden" name="email"
										value="<%=recyclebill.getEmail()%>"> <input
										type="hidden" name="type" value="recycle"> <input
										type="hidden" name="id" value="<%=recyclebill.getId()%>">
									<button type="submit" value="approved" name="choice">Approve</button>
									<button type="submit" value="rejected" name="choice">Reject</button>
								</form>
							</td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		function filterTable(tableId) {
			// Get input value and convert to lowercase for case-insensitive search
			var searchInput = document
					.getElementById(tableId + "-search-input").value
					.toLowerCase();

			// Get table rows
			var rows = document.querySelectorAll("#" + tableId + " tbody tr");

			// Loop through rows and hide those that don't match the search input
			rows.forEach(function(row) {
				var id = row.querySelector("td:first-child").textContent
						.toLowerCase();
				var status = row.querySelector("td:nth-child(3)").textContent
						.toLowerCase();

				if ((id.indexOf(searchInput) > -1)
						|| (status.indexOf(searchInput) > -1)) {
					row.style.display = "";
				} else {
					row.style.display = "none";
				}

			});
		}
	</script>
	<jsp:include page="../headerfooter/footer.jsp" />
</body>
</html>