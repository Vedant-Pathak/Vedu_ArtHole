<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:import url="header.jsp">
<c:param name="title" value="Vedu's Arthole Home"></c:param>
</c:import>

<sql:setDataSource var="ds" dataSource="jdbc/webshop" />
<sql:query dataSource="${ds}" sql="select * from images" var="results" />
<c:set var="tablewidth" value="6"/>
<table class="images">
<c:forEach var="image" items="${results.rows}" varStatus="colno">
	
	<c:if test="${colno.index % tablewidth == 0}">
	<tr>
	</c:if>
		
		<td>
		<c:set var="imgname" value="${image.imgdate}_${image.imgtime}"></c:set>
		<a href="<c:url value="/gallery?action=image&image=${image.id}" />">
			<img width = 200 src="${pageContext.request.contextPath}/images/${imgname}.jpg">
		</a>
		</td>
	
	<c:if test="${colno.index + 1 % tablewidth == 0}">
	</tr>
	</c:if>

</c:forEach>
</table>
</body>
</html>