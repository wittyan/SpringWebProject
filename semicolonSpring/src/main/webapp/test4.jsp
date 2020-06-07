<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>


[
<c:forEach var="i" items="${list}" varStatus="cnt">
     {
     "no":"${cnt.count}",
     "id":"${i.id }",
     "cnt":"${i.cnt }",
     "sum":"${i.sum }"
       <c:choose>
       <c:when test="${functions:length(list) eq cnt.count }">
       }
       </c:when>
       <c:otherwise>
       },
       </c:otherwise>
     </c:choose>
</c:forEach>
]