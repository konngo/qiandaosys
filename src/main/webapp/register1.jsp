<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>

<html>
<head>
    <title>教师注册</title>
</head>
<body>
<form action="teacherRegister.jsp">
    工号：<input type="text" name="tno"><br>
    姓名：<input type="text" name="username"><br>
    密码：<input type="text" name="password"><br>
    学院：<input type="text" name="college"><br>
    <input type="hidden" name="pages" value="${pages}">
    <input type="submit" value="提交">
</form>
</body>
</html>
