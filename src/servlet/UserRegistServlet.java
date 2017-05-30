package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.AddUser;
import entity.UserBean;

/**
 * Servlet implementation class UserRegistServlet
 */
@WebServlet("/UserRegistServlet")
public class UserRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegistServlet() {
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
		String url = null;

		// エンコーディング指定
        request.setCharacterEncoding("Windows-31J");
        response.setCharacterEncoding("Windows-31J");

        // JSPよりパラメータを取得
        //String action = request.getParameter("ACTION");
        String user_id = request.getParameter("ID");
        String password = request.getParameter("PASS");

        if(user_id.equals("") || password.equals("")){
        	url = "";
        }else{
        	UserBean user = new UserBean();
        	user.setUserId(user_id);
        	user.setPassword(password);

        	AddUser add = new AddUser();
        	boolean flag = add.addUser();

        	if(flag == true){
        		url = "successRegistUser.jsp";
        	}else{
        		url = "";
        	}
        }



        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
	}
}
