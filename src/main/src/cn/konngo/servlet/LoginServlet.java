package cn.konngo.servlet;

import cn.konngo.util.Common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

// 登录servlet
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1.获取用户名、密码、类型
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String type=req.getParameter("type");
        // 2.判断用户类型
        // 3.判断数据库中是否有该用户
        // 4.登录成功
        switch (type){
            case "0":checkAdmin(username,password,req,resp);break;
            case "1":checkTeacher(username,password,req,resp);break;
            case "2":checkStudent(username,password,req,resp);break;
        }
    }

    // 查询学生用户
    private void checkStudent(String username, String password, HttpServletRequest req, HttpServletResponse resp) {
        String []str={username,password};
        ResultSet set= Common.dbUtil.executeQuery("select * from students where sno='"+username+"' and password='"+password+"'");
        try {
            if (set.next()){
                //登录成功
                // 1. 保存登录信息
                storeLoginMessage("student",set.getInt("id"),req);
                // 2. 返回主界面
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            }else {
                //登录失败
                req.getRequestDispatcher("loginerror.jsp").forward(req,resp);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 查询教师用户
    private void checkTeacher(String username, String password, HttpServletRequest req, HttpServletResponse resp){
        String []str={username,password};
        ResultSet set= Common.dbUtil.executeQuery("select * from teacher where tno='"+username+"' and password='"+password+"'");
        try {
            if (set.next()){
                //登录成功
                // 1. 保存登录信息
                storeLoginMessage("teacher",set.getInt("id"),req);
                // 2. 返回主界面
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            }else {
                //登录失败
                req.getRequestDispatcher("loginerror.jsp").forward(req,resp);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 查询管理员用户
    private void checkAdmin(String username, String password, HttpServletRequest req, HttpServletResponse resp) {
        String []str={username,password};
        ResultSet set= Common.dbUtil.executeQuery("select * from admins where username='"+username+"' and password='"+password+"'");
        try {
            if (set.next()){
                //登录成功
                // 1. 保存登录信息
                storeLoginMessage("admin",set.getInt("id"),req);
                // 2. 返回主界面
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            }else {
                //登录失败
                req.getRequestDispatcher("loginerror.jsp").forward(req,resp);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void storeLoginMessage(String type, int id,HttpServletRequest req) {
        req.getSession().setAttribute("type",type);
        req.getSession().setAttribute("id",id);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
