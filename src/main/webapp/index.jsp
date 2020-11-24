<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String type= (String) session.getAttribute("type");
// 判断用户类型 返回不同jsp页面
if (type.equals("admin")){
    request.getRequestDispatcher("admin.jsp").forward(request,response);
} else if (type.equals("teacher")) {
    request.getRequestDispatcher("teacher.jsp").forward(request,response);
}else {
    request.getRequestDispatcher("student.jsp").forward(request,response);
}
%>
<html>
<head>
    <title>首页</title>
</head>
<body>
Hello World!
</body>
</html>
