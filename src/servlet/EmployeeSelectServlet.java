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

/**
 * Servlet implementation class EmployeeSelectServlet
 */
@WebServlet("/EmployeeSelectServlet")
public class EmployeeSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmployeeSelectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("Windows-31J");
	     response.setCharacterEncoding("Windows-31J");
	     String url = null;

	     String action = request.getParameter("ACTION");

	        ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
	        EmployeeDAO dao = new EmployeeDAO();

	        switch(action) {
	        case "従業員一覧・削除":

	            try {
	                employeeList = dao.selectEmployee();
	            } catch(Exception e) {

	            }
	            request.setAttribute("employeList", employeeList);

	            url = "employeelist.jsp";
	            break;


	        }
	        RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
	}
}
