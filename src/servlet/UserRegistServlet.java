package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.AddUser;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;

		// エンコーディング指定
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");

		// JSPよりパラメータを取得
		String action = request.getParameter("ACTION");
		String user_id = request.getParameter("ID");
		String password = request.getParameter("PASS");

		switch (action) {
		// ユーザの登録
		case "regist":
			// ビジネスロジックAddUserをインスタンス化
			AddUser add = new AddUser();
			boolean overlap = add.overlapError(user_id);
			// 登録するIDまたはpassが未入力の場合、失敗
			if (user_id.equals("") || password.equals("") || overlap == true) {
				url = "success_failure.jsp";
			}
			// IDとpassが入力されている場合、登録処理へ
			else {

				// 戻り値は登録成功か判定の結果
				boolean flag = add.addUser(user_id, password);
				// true/成功、false/失敗
				if (flag == true) {
					url = "successRegistUser.jsp";
				} else {
					url = "success_failure.jsp";
				}
			}
			break;

		// ユーザ登録画面へ
		case "add_user":
			url = "registUser.jsp";
			break;

		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
