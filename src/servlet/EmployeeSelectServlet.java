package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;
import entity.EmployeeBean;

@WebServlet("/EmployeeSelectServlet")
public class EmployeeSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeeSelectServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// エンコーディング指定
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");

		// 移譲する先のjspを格納する変数url
		String url = null;

		// formから値を取得
		String action = request.getParameter("ACTION");

		// DAO、Beanをインスタンス化
		ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
		EmployeeDAO dao = new EmployeeDAO();

		// formからの値が「従業員一覧・削除」の場合、DAOを介しDBから取得しrequestスコープに格納
		// 移譲先に「employeelist.jsp」を指定
		switch (action) {
		case "従業員一覧・削除":

			// DAOからのreturnをBeanに格納
			try {
				employeeList = dao.selectEmployee();
			} catch (Exception e) {

			}

			// requestスコープに格納
			request.setAttribute("employeList", employeeList);

			// 遷移する先を指定
			url = "employeelist.jsp";
			break;
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
