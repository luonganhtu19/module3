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

    // check login
    protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String userName=request.getParameter("username");
        String password=request.getParameter("password");
        session=request.getSession();
        String action=(String) session.getAttribute("actionBe");
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
    //check input
    private boolean checkMatchInput(String valueInput){

        Pattern pattern=Pattern.compile("^(?=.{1,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])");
        boolean check=pattern.matcher(valueInput).matches();
        return check;
    }
    //check action, take link
    private String dirURL(User user, String action, HttpSession session){
        /// use iframe in page Index, because path default is: path: index.jsp
        String pathUrl="index.jsp";
            // tao moi user
            if (action.equals("create")){
                session.setAttribute("path","service/CreateUser.jsp");
                pathUrl= "service/CreateUser.jsp";
            }
            // chua dang nhap
            else if (action.equals("playGame") && user ==null || action.equals("login")){
                pathUrl = "service/Login.jsp";
                session.setAttribute("actionBe","playGame");
                if (action.equals("login"))  session.setAttribute("actionBe","home");;
            }
            // da dang nhap
            else {
                switch (action){
                    case "playGame":
                        session.setAttribute("path", "/Game/BroadGame.jsp");
                        break;
                    case "ManagerCustomer":
                        List<User> users= userDao.selectListUser(user);
                        session.setAttribute("users",users);
                        session.setAttribute("path","/service/UserManagement.jsp");
                        break;
                    case "logout":
                        session.removeAttribute("user");
                        session.setAttribute("path","Game/News.jsp");
                    default:
                        session.setAttribute("path","Game/News.jsp");
                }
            }
        return pathUrl;
    }
    // forward servlet switch diff jsp(view)
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
