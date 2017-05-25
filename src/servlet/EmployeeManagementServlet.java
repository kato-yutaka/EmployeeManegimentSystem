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
        if("入力内容を登録".equals(action)){
        	 // DAO、Beanをインスタンス化
            ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
            EmployeeDAO dao = new EmployeeDAO();

        	String l_name = request.getParameter("l_name");
        	String f_name = request.getParameter("f_name");
        	String l_kana_name = request.getParameter("l_kana_name");
        	String f_kana_name = request.getParameter("f_kana_name");
        	String sex = request.getParameter("sex");
        	String birth = request.getParameter("emp_code");
        	String emp_code = request.getParameter("emp_code");
        }
        if("従業員登録".equals(action)){

        	 // DAO、Beanをインスタンス化
            ArrayList<EmployeeBean> sectionList = new ArrayList<EmployeeBean>();

            EmployeeDAO dao = new EmployeeDAO();

            // DAOからのreturnをBeanに格納
            try {
               sectionList = dao.selectSection();
            } catch(Exception e) {
                e.printStackTrace();
            }
            System.out.print(sectionList.get(1).getSection_name());
            // requestスコープに格納
            request.setAttribute("sectionList", sectionList);

            // 移譲先の指定
            url = "registEmployee.jsp";
        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

	}

}
