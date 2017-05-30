package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import entity.UserBean;

/**
 * Servlet implementation class UserManagementServlet
 */
@WebServlet("/UserManagementServlet")
public class UserManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// エンコーディング指定
        request.setCharacterEncoding("Windows-31J");
        response.setCharacterEncoding("Windows-31J");

        // formからの値を取得
        String action = request.getParameter("ACTION");
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        //データベースのid,pass変数
        String id_a=null;
        String password_a=null;
        //String user[] = new String[2];

        // 移譲する先のjspを格納する変数url
        String url = null;


        //ログインボタンを押した
        if(action.equals("111")){
        	// DAO、Beanをインスタンス化
            ArrayList<UserBean> userList = new ArrayList<UserBean>();
            UserDAO dao = new UserDAO();

            //DAOからuserListをreturn
            try {
            	userList = dao.selectUser();
            } catch(Exception e) {
                e.printStackTrace();
            }

            //豆にuserListインスタンスを持たせる
            for(int i = 0; i < userList.size(); i++){
                UserBean user = userList.get(i);

	            id_a=user.getUserId();
	            password_a=user.getPassword();
	            //id,passの認証
	            if(id.equals(id_a) && password.equals(password_a)){
	            	url="menu.jsp";
	            	HttpSession session = request.getSession();
	            	session.setAttribute("ACCESS", id_a);

	            }
            }
            if(url!="menu.jsp"){
            	url="login_failure.jsp";
            }

        }
        //ログイン画面へボタンを押した
        else if(action.equals("222")){
        	url="login_form.jsp";
        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

	}

}
