<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.konngo.util.Common" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新教师信息</title>
</head>
<body>

<%
    String id=request.getParameter("id");
    String sql="select * from teacher where id="+id;
    ResultSet set= Common.dbUtil.executeQuery(sql);
    set.next();
    String tno =set.getString("tno");
    String name=set.getString("name");
    String password=set.getString("password");
    String college=set.getString("college");

%>
<form action="updateTServlet" >
    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
    学号：<input type="text" name="tno"  value="<%=tno%>">
    <br>
    姓名: <input type="text" name="name"  value="<%=name%>">
    <br>
    密码：<input type="text" name="password"  value="<%=password%>">
    <br>
    学院：<input type="text" name="college"  value="<%=college%>">
    <br>
    <input type="submit" value="提交">
</form>
</body>
</html>
