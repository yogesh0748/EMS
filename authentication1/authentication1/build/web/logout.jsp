<!-- logout.jsp -->
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
