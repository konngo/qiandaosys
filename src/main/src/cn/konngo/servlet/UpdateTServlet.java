package cn.konngo.servlet;

import cn.konngo.util.Common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 更新教师信息
 */
public class UpdateTServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取要修改的教师信息
        String id=req.getParameter("id");
        String name=req.getParameter("name");
        String password=req.getParameter("password");
        String classes=req.getParameter("college");
        // 数据库中进行修改操作
        String sql="update teacher set name='"+name+"' and password='"+password+"' and college='"+classes+"' where id="+id;
        Common.dbUtil.executeUpdate(sql);
        req.getRequestDispatcher("admin.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
