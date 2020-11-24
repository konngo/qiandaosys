<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.konngo.util.Common" %>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师</title>
</head>
<body>
<a href="createQiandao.jsp">发起签到</a>

<span style="color: red">${status}</span>

<table border="1px">
    <tr>
        <td>签到码</td>
        <td>状态</td>
    </tr>
    <%
        // 查询所有签到信息
        String sql="select * from qiandao ";
        ResultSet set= Common.dbUtil.executeQuery(sql);
        while (set.next()){
    %>
    <tr>
        <td><%=set.getString("code")%></td>
        <td><%=set.getString("status")%></td>
        <td>
            <a href="searchQiandaoStudent.jsp?id=<%=set.getInt("id")%>">查看签到学生</a>
            <a href="closeqiandao.jsp?id=<%=set.getInt("id")%>">结束签到</a>
            <a href="buqian.jsp?id=<%=set.getInt("id")%>">补签</a>
        </td>
    </tr>
    <%
        }
    %>

</table>
</body>
</html>
