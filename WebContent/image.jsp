<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="header.jsp">
	<c:param name="title" value="Vedu's Arthole Home- View Image"></c:param>
</c:import>
<center>

	<%-- Fetch the image data --%>

	<%-- If we also need to update the image rating, we need to
	get the image data and updating the rating in a single transaction --%>

	<sql:transaction dataSource="jdbc/webshop">

		<sql:query sql="select * from images where id=?" var="results">
			<sql:param>${param.image}</sql:param>
		</sql:query>

		<%-- Get the row for this image and format the file name --%>
		<c:set scope="page" var="image" value="${results.rows[0]}"></c:set>
	</sql:transaction>
	<h2 align = "center">${image.descriptor}</h2>
	<c:if test="${image.add_info != null}">
	<h4 align = "center">${image.add_info}</h4>
	</c:if>
	<c:set var="imgname" value="${image.imgdate}_${image.imgtime}"></c:set>
	<img width = 800 src="${pageContext.request.contextPath}/images/${imgname}.jpg">
</body>
</html>