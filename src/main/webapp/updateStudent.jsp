<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.konngo.util.Common" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新学生信息</title>
</head>
<body>
<%

    // 获取学生编号
String id=request.getParameter("id");
String sql="select * from students where id="+id;
// 从数据库中查询学生信息
ResultSet set= Common.dbUtil.executeQuery(sql);
set.next();
String sno =set.getString("sno");
String name=set.getString("name");
String password=set.getString("password");
String classes=set.getString("classes");


%>
<form action="updateSServlet" >
    <input type="hidden" name="id" value="<%=id%>">
    学号：<input type="text" name="sno" value="<%=sno%>">
    <br>
    姓名: <input type="text" name="name" value="<%=name%>">
    <br>
    密码：<input type="text" name="password" value="<%=password%>">
    <br>
    班级：<input type="text" name="classes" value="<%=classes%>">
    <br>
    <input type="submit" value="提交">
</form>
</body>
</html>
