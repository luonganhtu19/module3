package controller;

import dao.UserDao;
import model.Card;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet(name = "userServlet" , urlPatterns = "/userServlet")
public class UserServlet extends HttpServlet {
    private UserDao userDao;
    private HttpSession session;


    public void init(){
        userDao=new UserDao();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       HttpSession session=req.getSession();
       String action=req.getParameter("action");
       String path=dirURL((User) session.getAttribute("user"),action,session);
       dispatcher(req,resp,path);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }


    protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String userName=request.getParameter("username");
        String password=request.getParameter("password");
        session=request.getSession();
        String action= request.getParameter("action");
        User user=null;
        if (checkMatchInput(userName)&&checkMatchInput(password)) {
            user = userDao.checkLogin(userName,password);
            if (user!=null){
                session.setAttribute("user",user);
                dispatcher(request,response,dirURL(user,action,session));
            }else {
                session.setAttribute("message","UserName or Password is wrong");
                dispatcher(request,response,dirURL(user,action,session));
            }
        }else {
            session.setAttribute("message","Input value error");
            dispatcher(request,response,dirURL(user,action,session));
        }
    }
    private boolean checkMatchInput(String valueInput){
        Pattern pattern=Pattern.compile("^(?=.{1,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])");
        boolean check=pattern.matcher(valueInput).matches();
        return check;
    }
    private String dirURL(User user,String action,HttpSession session){
        String pathUrl=null;
        if (action.equals("home")){
            session.setAttribute("path","Game/News.jsp");
            pathUrl="index.jsp";
            return pathUrl;
        }else {
            if (user==null){
                return pathUrl="service/login.jsp";
            }else {
                switch (action){
                    case "playGame":
                        session.setAttribute("path","/Game/broadGame.jsp");
                        session.removeAttribute("users");
                        break;
                    case "ManagerCustomer":
                        session.setAttribute("path","/service/userManagement.jsp");
                        List<User> users= userDao.selectListUser(user);
                        session.setAttribute("users",users);
                        break;

                }
                if (pathUrl==null){
                    pathUrl="index.jsp";
                }
                return pathUrl;
            }
        }
    }
    private void dispatcher(HttpServletRequest request,HttpServletResponse response,String pathUrl){
        session=request.getSession();
        session.setAttribute("patchUrl",pathUrl);
        RequestDispatcher dispatcher= request.getRequestDispatcher(pathUrl);
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
