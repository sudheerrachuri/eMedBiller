<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Medicine</title>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<script type="text/javascript">
	function calc() {
		var items = document.getElementById("items").value;
		var strips = document.getElementById("strips").value;
		document.getElementById("quantity").value = items * strips;
	}
</script>
</head>
<body class="bg">
	<a href="home.jsp"><button type="button">Home</button></a>
	<a href="logout" style="float: right"><button type="button">logout</button></a>

	<center>
		<h1>Modify Medicine</h1>
		<c:out value="${error}" />
		<c:out value="${success}" />
		<form name="modifyMedicineForm" action="modifymedicine" method="post">
			<input type="hidden" name="medicineId" value="${medicine.id}">
			<table>
				<tr>

					<td>Medicine Name</td>
					<td><input type="text" name="medicineName"
						value="${medicine.name}" required></td>
				</tr>
				<tr>
					<td>Medicine Type</td>
					<td><select name="medicineType" required>
							<c:forEach items="${items}" var="item">

								<c:if test="${medicine.item.id== item.id}">
									<option value="${item.id}" selected>${item.type}</option>
								</c:if>
								<c:if test="${medicine.item.id!=item.id }">
									<option value="${item.id}">${item.type}</option>
								</c:if>
							</c:forEach>

					</select><br /></td>
				</tr>
				<tr>

					<td>Cost Price</td>
					<td><input type="text" name="cp" value="${medicine.costPrice}"
						required></td>
				</tr>
				<tr>
					<td>Selling Price</td>
					<td><input type="text" name="sp"
						value="${medicine.sellingPrice}" required></td>
				</tr>
				<tr>
					<td>Items per Strip</td>
					<td><input type="number" name="items" id="items"
						value="${medicine.itemsPerStrip}" required></td>
				</tr>
				<tr>
					<td>No. of Strips</td>
					<td><input type="text" name="strips" id="strips"
						value="${medicine.strips}" required></td>
				</tr>
				<tr>
					<td>Quantity</td>
					<td><input type="text" name="quantity" id="quantity"
						onfocus="calc()" value="${medicine.quantity}" readonly></td>
				</tr>
			</table>

			<input type="submit" value="Submit">

		</form>
	</center>
</body>
</html>