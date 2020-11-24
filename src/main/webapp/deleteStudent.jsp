<%@ page import="cn.konngo.util.Common" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除学生</title>
</head>
<body>
<%
    String id=request.getParameter("id");
    // 根据id从数据库中删除学生信息
    String sql="delete from students where id="+id;
    Common.dbUtil.execute(sql);
    request.getRequestDispatcher("admin.jsp").forward(request,response);
%>
</body>
</html>
