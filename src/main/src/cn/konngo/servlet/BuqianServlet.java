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
 * 补签
 */
public class BuqianServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取签到码
        String code=req.getParameter("code");
        // 获取学号
        String sno=req.getParameter("sno");

        // 查询签到码
        String sql="select * from qiandao where  code='"+code+"'";
        ResultSet set= Common.dbUtil.executeQuery(sql);
        try {
            if (set.next()){

                // 根据学号查询学生编号
                int qid=set.getInt("id");
                sql="select * from students where sno='"+sno+"'";
                ResultSet studentset= Common.dbUtil.executeQuery(sql);
                if (studentset.next()){
                    int tsid=studentset.getInt("id");
                    // 进行补签
                    String insertSql="insert into sqiandao (qid,tsid) values('"+qid+"','"+tsid+"')";
                    Common.dbUtil.execute(insertSql);
                    req.getSession().setAttribute("status","success");
                    // 成功
                }

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        req.getRequestDispatcher("teacher.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
