<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body>
<form action="login" method="post">
    用户名：<input type="text" name="username">
    密码: <input type="password" name="password">
    用户类型:
    <select name="type" >
        <option value="0">管理员</option>
        <option value="1">教师</option>
        <option value="2">学生</option>
    </select>
    <input type="submit" value="登录">
<%--    <a href="register.jsp">注册</a>--%>
</form>
</body>
</html>
