<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>



[
<c:forEach var="i" items="${list}" varStatus="cnt">
   {"name":"${i}"}
   <c:if test="${functions:length(list) ne cnt.count }">
   ,
   </c:if>     
</c:forEach>
]