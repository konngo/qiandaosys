package cn.konngo.servlet;

import cn.konngo.util.Common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 更新学生信息
public class UpdateSServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取学生信息
        String id=req.getParameter("id");
        String name=req.getParameter("name");
        String password=req.getParameter("password");
        String classes=req.getParameter("classes");
        // 在数据库中更新学生信息
        String sql="update students set name='"+name+"' and password="+password+"' and classes='"+classes+"' where id="+id;
        Common.dbUtil.executeUpdate(sql);
        // 返回主页
        req.getRequestDispatcher("admin.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
