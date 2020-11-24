<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.konngo.util.Common" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员首页</title>
</head>
<body>
<h2>教师管理</h2>
<a href="admin.jsp">学生管理</a>
<%
    request.getSession().setAttribute("pages","admint");
%>
<a href="register1.jsp">添加教师</a>
<table border="1px">
    <tr>
        <td>工号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>学院</td>
        <td>操作</td>
    </tr>
    <%
        // 查询所有教师信息在表格中输出
        String sql="select * from teacher ";
        ResultSet set= Common.dbUtil.executeQuery(sql);
        while (set.next()){
    %>
    <tr>
        <td><%=set.getString("tno")%></td>
        <td><%=set.getString("name")%></td>
        <td><%=set.getString("password")%></td>
        <td><%=set.getString("college")%></td>
        <td>
            <a href="updateTeacher.jsp?id=<%=set.getInt("id")%>">修改</a>
            <a href="deleteTeacher.jsp?id=<%=set.getInt("id")%>">删除</a>
        </td>
    </tr>
    <%
        }
    %>

</table>
</body>
</html>
