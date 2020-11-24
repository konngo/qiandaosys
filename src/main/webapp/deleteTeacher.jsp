<%@ page import="cn.konngo.util.Common" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除教师</title>
</head>
<body>
<%
    String id=request.getParameter("id");
    // 根据编号从数据库中删除教师信息
    String sql="delete from teacher where id="+id;
    Common.dbUtil.execute(sql);
    request.getRequestDispatcher("admin.jsp").forward(request,response);
%>
</body>
</html>
