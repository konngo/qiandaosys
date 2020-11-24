<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.konngo.util.Common" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看签到学生</title>
</head>
<body>
<table border="1px">
    <tr>
        <td>学号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>班级</td>
    </tr>
    <%
        int id= Integer.parseInt(request.getParameter("id"));
        // 查询所有学生信息在表格中输出
        String sql="select s.id,s.sno,s.name,s.password,s.classes from students s join sqiandao q on s.id=q.tsid where qid= "+id;
        ResultSet set= Common.dbUtil.executeQuery(sql);
        while (set.next()){
    %>
    <tr>
        <td><%=set.getString("sno")%></td>
        <td><%=set.getString("name")%></td>
        <td><%=set.getString("password")%></td>
        <td><%=set.getString("classes")%></td>

    </tr>
    <%
        }
    %>

</table>
</body>
</html>
