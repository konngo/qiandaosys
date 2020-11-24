<%@ page import="cn.konngo.util.Common" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生注册</title>
</head>
<body>
<%
    // 获取填写的学生信息
    String sno=request.getParameter("sno");
    String name=request.getParameter("username");
    String password=request.getParameter("password");
    String classes=request.getParameter("classes");
    // 拼接sql语句
    String sql="insert into students (sno,name,password,classes) values('"+sno+"','"+name+"','"+password+"','"+classes+"')";
    // 执行sql语句 将信息存放到数据库中
    Common.dbUtil.execute(sql);
    if (request.getParameter("pages")!=null&&request.getParameter("pages")!=""){
        String pages=request.getParameter("pages");
        request.getSession().setAttribute("status","添加成功");
        request.getRequestDispatcher(pages+".jsp").forward(request,response);
        return;
    }
    request.getSession().setAttribute("status","注册成功");
    request.getRequestDispatcher("login.jsp").forward(request,response);
%>
</body>
</html>
