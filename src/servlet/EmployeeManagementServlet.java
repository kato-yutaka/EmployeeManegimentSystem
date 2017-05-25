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


		  // エンコーディング指定

        request.setCharacterEncoding("Windows-31J");
        response.setCharacterEncoding("Windows-31J");


        String action = request.getParameter("ACTION");


        String url = null;

        if("従業員一覧・削除".equals(action)) {

            // DAO、Beanをインスタンス化
            ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
            EmployeeDAO dao = new EmployeeDAO();


            try {
                employeeList = dao.selectEmployee();
            } catch(Exception e) {
                e.printStackTrace();
            }

            request.setAttribute("employeList", employeeList);


            url = "employeelist.jsp";
        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

	}

}
