package cn.konngo.servlet;

import cn.konngo.util.Common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 学生进行签到
 */
public class QiandaoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取签到码
        String code=req.getParameter("code");
        int tsid= (int) req.getSession().getAttribute("id");
        // 查询签到码是否存在
        String sql="select * from qiandao where status=0 and code='"+code+"'";
        ResultSet set=Common.dbUtil.executeQuery(sql);
        try {
            if (set.next()){
                int qid=set.getInt("id");
                // 可以进行签到
                String insertSql="insert into sqiandao (qid,tsid) values('"+qid+"','"+tsid+"')";
                Common.dbUtil.execute(insertSql);
                req.setAttribute("status","success");
                // 成功
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        req.getRequestDispatcher("student.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
