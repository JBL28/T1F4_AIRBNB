<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<jsp:forward page="/WEB-INF/views/accommodations/list.jsp" />
