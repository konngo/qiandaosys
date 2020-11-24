<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>学生界面</title>
</head>
<body>
<span style="color: red">${status}</span>
<br>
<form action="qiandao">
    签到码：<input type="text" name="code">
    <input type="submit" value="签到">
</form>
</body>
</html>
