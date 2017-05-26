package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

            //DAOからidをreturn
            try {
            	id_a = dao.userId();
            } catch(Exception e) {
                e.printStackTrace();
            }

            //DAOからpassをreturn
            try {
            	password_a = dao.passWord();
            } catch(Exception e) {
                e.printStackTrace();
            }

            if(id.equals(id_a) && password.equals(password_a)){
            	url="menu.html";
            }
            else{
            	url="login_failure.jsp";
            }


            /*
            for(int i = 0; i < userList.size(); i++){
                UserBean user = userList.get(i);


            //id_a=user.getUserId();
            System.out.println(id_a);

            password_a=user.getPassword();
            //password_a=bean.getPassword();
            }
            */


        }
        else if(action.equals("222")){
        	url="login_form.jsp";
        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

	}

}
