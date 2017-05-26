package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Remove;

/**
 * Servlet implementation class EmployeeDeleteServlet
 */
@WebServlet("/EmployeeDeleteServlet")
public class EmployeeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 削除専用処理

		String url = null;
		// エンコーディング指定
        request.setCharacterEncoding("Windows-31J");
        response.setCharacterEncoding("Windows-31J");

        // JSPよりパラメータを取得
        String code = request.getParameter("ACTION");

        // 削除完了・失敗で使用
    	request.setAttribute("CODE", code);

        // インスタンス化
    	Remove remove = new Remove(code);

    	// 削除処理とフラグ判定
    	boolean flag = remove.removeEmployee();
    	if(flag == true){
    		url = "delete_success.jsp";
    	}else{
    		url = "delete_failure.jsp";
    	}

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

	}
}
