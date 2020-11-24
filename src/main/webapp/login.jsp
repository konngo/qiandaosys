<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>登录页面</title>
    <%
    request.getSession().removeAttribute("pages");
    %>
</head>
<body>


<span style="color: red">${status}</span>
<br>
<form action="login" method="post">
    用户名：<input type="text" name="username"><br>
    密码: <input type="password" name="password"><br>
    用户类型:
    <select name="type" >
        <option value="0">管理员</option>
        <option value="1">教师</option>
        <option value="2">学生</option>
    </select><br>
    <input type="submit" value="登录">
<%--    <a href="register.jsp">注册</a>--%>
</form>
<br>
<a href="register.jsp">学生注册</a><br>
<a href="register1.jsp">教师注册</a>
</body>
</html>
