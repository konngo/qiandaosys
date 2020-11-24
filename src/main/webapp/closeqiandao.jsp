<%@ page import="cn.konngo.util.Common" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>关闭签到</title>
</head>
<body>
<%
    // 获取签到编号
    String id=request.getParameter("id");
    // 将状态修改成1 1表示关闭
    String sql="update qiandao set status=1 where id="+id;
    Common.dbUtil.execute(sql);
    request.getRequestDispatcher("teacher.jsp").forward(request,response);
%>
</body>
</html>
