<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>

<html>
<head>
    <title>学生注册</title>

</head>
<body>
<form action="studentRegister.jsp">
    学号：<input type="text" name="sno"><br>
    姓名：<input type="text" name="username"><br>
    密码：<input type="text" name="password"><br>
    班级：<input type="text" name="classes"><br>
    <input type="hidden" name="pages" value="${pages}">
    <input type="submit" value="提交">
</form>
</body>
</html>
