<%@ page import="cn.konngo.util.Common" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师注册</title>
</head>
<body>
<%
    // 获取教师信息
    String tno=request.getParameter("tno");
    String name=request.getParameter("username");
    String password=request.getParameter("password");
    String college=request.getParameter("college");
    // 拼接插入sql
    String sql="insert into teacher (tno,name,password,college) values('"+tno+"','"+name+"','"+password+"','"+college+"')";
    // 执行插入 将数据存放到数据库中
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
