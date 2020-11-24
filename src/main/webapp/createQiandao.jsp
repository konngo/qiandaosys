<%@ page import="cn.konngo.util.Common" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发起签到</title>
</head>
<body>
    <%
        // 获取教师编号
        int tid= (int) session.getAttribute("id");
        // 执行插入语句，发起签到
        // 签到码 随机生成7位数作为签到码
        int code=(int) ((Math.random() * 9 + 1) * 1000000);

        String insertSql="insert into qiandao (tid,code,status) values('"+tid+"','"+code+"',0)";
        Common.dbUtil.execute(insertSql);
        request.getRequestDispatcher("teacher.jsp").forward(request,response);
    %>
</body>
</html>
