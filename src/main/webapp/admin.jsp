<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.konngo.util.Common" %><%--
  Created by IntelliJ IDEA.
  User: LiJunPeng
  Date: 2020/11/24
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员首页</title>
</head>
<body>
<h2>学生管理</h2>
<a href="admint.jsp">教师管理</a>
<table border="1px">
    <tr>
        <td>学号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>班级</td>
        <td>操作</td>
    </tr>
    <%
        // 查询所有学生信息在表格中输出
        String sql="select * from students ";
        ResultSet set= Common.dbUtil.executeQuery(sql);
        while (set.next()){
            %>
    <tr>
        <td><%=set.getString("sno")%></td>
        <td><%=set.getString("name")%></td>
        <td><%=set.getString("password")%></td>
        <td><%=set.getString("classes")%></td>
        <td>
            <a href="updateStudent.jsp?id=<%=set.getInt("id")%>">修改</a>
            <a href="deleteStudent.jsp?id=<%=set.getInt("id")%>">删除</a>
        </td>
    </tr>
    <%
        }
    %>

</table>
</body>
</html>
