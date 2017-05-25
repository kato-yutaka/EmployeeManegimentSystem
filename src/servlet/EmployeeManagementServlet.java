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
import entity.Remove;


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
		String url = null;

		// エンコーディング指定
        request.setCharacterEncoding("Windows-31J");
        response.setCharacterEncoding("Windows-31J");

        // JSPよりパラメータを取得
        String action = request.getParameter("ACTION");

        // 削除であるか判定
        String code = null;
        if(action.length() == 4){
        	code = action;
        	action = "削除";
        }


        // DAO、Beanをインスタンス化
        ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
        EmployeeDAO dao = new EmployeeDAO();

        switch(action) {
        case "従業員一覧・削除":

            try {
                employeeList = dao.selectEmployee();
            } catch(Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("employeList", employeeList);

            url = "employeelist.jsp";
            break;

        case "従業員一覧へ":
            try {
                employeeList = dao.selectEmployee();
            } catch(Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("employeList", employeeList);

            url = "employeelist.jsp";
            break;

        case "入力内容を登録":
        	String l_name = request.getParameter("l_name");
        	String f_name = request.getParameter("f_name");
        	String l_kana_name = request.getParameter("l_kana_name");
        	String f_kana_name = request.getParameter("f_kana_name");
        	String sex = request.getParameter("sex");
        	String birth = request.getParameter("emp_code");
        	String emp_code = request.getParameter("emp_code");
        	break;

        case "削除":
        	// インスタンス化
        	Remove remove = new Remove(code);
        	// 削除完了・失敗で使用
        	request.setAttribute("CODE", code);
        	// 削除処理とフラグ判定
        	boolean flag = remove.removeEmployee();
        	if(flag == true){
        		url = "delete_success.jsp";
        	}else{
        		url = "delete_failure.jsp";
        	}
        	break;

        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

	}

}
