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

import dao.EmployeeDAO;
import entity.EmployeeBean;

@WebServlet("/EmployeeManagementServlet")
public class EmployeeManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeManagementServlet() {
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

		// DAO、Beanをインスタンス化
		ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
		EmployeeDAO dao = new EmployeeDAO();

		switch (action) {

		case "従業員一覧へ":
			try {
				employeeList = dao.selectEmployee();
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("employeList", employeeList);

			url = "employeelist.jsp";

			break;

		case "メニュー画面へ":
			request.setAttribute("employeList", employeeList);
			HttpSession reg_session = request.getSession();
			reg_session.removeAttribute("emp_code");
			reg_session.removeAttribute("l_name");
			reg_session.removeAttribute("f_name");
			reg_session.removeAttribute("l_kana_name");
			reg_session.removeAttribute("f_kana_name");
			reg_session.removeAttribute("sex_str");
			reg_session.removeAttribute("birth_day_str");
			reg_session.removeAttribute("section_name");
			reg_session.removeAttribute("emp_date_str");
			reg_session.removeAttribute("error_tips");
			url = "menu.jsp";
			break;

		case "ログアウト":

			request.setAttribute("employeList", employeeList);

			url = "logout.jsp";
			break;

		default:
			url = "unauthorized_access.jsp";
			break;
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}
}
