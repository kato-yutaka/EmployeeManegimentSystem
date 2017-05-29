package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Exception.DuplicateException;
import dao.EmployeeDAO;
import entity.EmployeeBean;
import entity.Regist;
/**
 * Servlet implementation class RegistEmployeeServlet
 */
@WebServlet("/RegistEmployeeServlet")
public class RegistEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistEmployeeServlet() {
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
		String url = null;
		// エンコーディング指定
        request.setCharacterEncoding("Windows-31J");
        response.setCharacterEncoding("Windows-31J");

        // JSPよりパラメータを取得
        String action = request.getParameter("ACTION");

        String emp_code = null;
    	String l_name = null;
    	String f_name = null;
    	String l_kana_name = null;
    	String f_kana_name = null;
    	String sex_str = null;
    	String birth_day_str = null;
    	String section_name = null;
    	String emp_date_str = null;

        // DAO、Beanをインスタンス化
        ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
        EmployeeDAO dao = new EmployeeDAO();
        ArrayList<String> nullList = new ArrayList<String>();
        ArrayList<String> error_message = new ArrayList<String>();
        ArrayList<Integer> error_number = new ArrayList<Integer>();

        switch(action) {

		case "入力内容を登録":
			try
	    	{
				//requestの値を取得
	    		emp_code = request.getParameter("emp_code");
	        	l_name = request.getParameter("l_name");
	        	f_name = request.getParameter("f_name");
	        	l_kana_name = request.getParameter("l_kana_name");
	        	f_kana_name = request.getParameter("f_kana_name");
	        	sex_str = request.getParameter("sex");
	        	System.out.println(request.getParameter("birth_day"));
	        	birth_day_str = request.getParameter("birth_day");
	        	section_name = request.getParameter("section_name");
	        	emp_date_str = request.getParameter("emp_date");


	        	//null、空文字チェック 未入力の項目があれば例外スロー


	        	boolean is_null = false;

	        	if(emp_code == null || emp_code.length() == 0){
	 				nullList.add("従業員コード");
	 				is_null = true;
	 			}
	 			if(l_name == null|| l_name.length() == 0){
	 				nullList.add("氏名（姓)");
	 				is_null = true;
	 			}
	 			if(f_name == null|| f_name.length() == 0){
	 				nullList.add("氏名（名)");
	 				is_null = true;
	 			}
	 			if(l_kana_name == null|| l_kana_name.length() == 0){
	 				nullList.add("氏名（セイ)");
	 				is_null = true;
	 			}
	 			if(f_kana_name == null|| f_kana_name.length() == 0){
	 				nullList.add("氏名(メイ)");
	 				is_null = true;
	 			}
	 			if(sex_str == null|| sex_str.length() == 0){
	 				nullList.add("性別");
	 				is_null = true;
	 			}
	 			if(birth_day_str == null|| birth_day_str.length() == 0){
	 				nullList.add("生年月日");
	 				is_null = true;
	 			}
	 			if(section_name == null|| section_name.length() == 0){
	 				nullList.add("部署名");
	 				is_null = true;
	 			}
	 			if(emp_date_str.equals(null)|| emp_date_str.length() == 0){
	 				nullList.add("入社日");
	 				is_null = true;
	 			}
	 			if(is_null){
	 				throw new NullPointerException();//未入力例外スロ－
	 			}

	 			else{
	 				boolean is_error = false;//エラー判定用
	 	            employeeList = dao.selectEmployee();//データベースから従業員コードを取得

	 	            //従業員コード重複判定
	 	            for(int i = 0; i < employeeList.size(); i++){

	 	            		if(emp_code.equals(employeeList.get(i).getCode())){
	 	            			is_error = true;
	 	            			error_number.add(3);
	 	            			error_message.add("従業員コードが重複しています");

	 	            		}
	 	            }

	 	            //カタカナ判定
	 	            if (l_kana_name.matches(Regist.toMatchRegex(Regist.KATAKANA_CODES))) {
	 	            	is_error = true;
	            			error_number.add(4);
	            			error_message.add("フリガナはカタカナで入力してください");
	 	        	}



	 	           Date birth_day = null;
	 	           Date emp_date = null;
	 	            //日付判定
	 	           if (Regist.checkDate(birth_day_str)){
	 	        	  if (Regist.compareToday(birth_day_str)){
	 	        		  //エラーなし

	 	        	  }else{
	 	        		 is_error = true;
	            			error_number.add(7);
	            			error_message.add("生年月日に未来が入力されています:" + birth_day_str);
	 	        	  }
	 	           }else{
	 	        	  is_error = true;
           			error_number.add(5);
           			error_message.add("正しい生年月日を入力してください");
	 	           }



	 	          if (Regist.checkDate(emp_date_str)){
	 	        	 if (Regist.compareToday(emp_date_str)){
	 	        		 //エラーなし

	 	        	  }else{
	 	        		 is_error = true;
	            			error_number.add(8);
	            			error_message.add("入社日に未来が入力されています:" + emp_date_str);
	 	        	  }

	 	           }else{
	 	        	  is_error = true;
           			error_number.add(6);
           			error_message.add("正しい入社日を入力してください");
	 	           }

	 	        //エラー発生したなら例外スロー
	 	            if(is_error){
	 	            	throw new  DuplicateException();

	 	            }

	 	        //日付をsql.Dateに型変換
	 	         birth_day_str = birth_day_str.replace('/', '-');
	 	         emp_date_str = emp_date_str.replace('/', '-');
	 	         birth_day = Date.valueOf(birth_day_str);
		         emp_date = Date.valueOf(emp_date_str);


	 				byte sex = Byte.parseByte(sex_str);
		        	//Beanに値をセット
		    		EmployeeBean employee = new EmployeeBean();
		    		employee.setCode(emp_code);
		 			employee.setL_name(l_name);
		 			employee.setF_name(f_name);
		 			employee.setSex(sex);
		 			employee.setL_kana_name(l_kana_name);
		 			employee.setF_kana_name(f_kana_name);
		 			employee.setBirth_day(birth_day);
		 			employee.setSection_name(section_name);
		 			employee.setEmp_date(emp_date);

		 			//インサート実行
		            dao.insertEmployee(employee);
		            url = "successRegistEmployee.jsp";


	 			}
	         }

			//未入力例外
			catch(NullPointerException e){

				error_message.add("未入力の項目があります");
	        	url = "regist_failure.jsp";
	            e.printStackTrace();
	            System.out.println(error_message);
	            error_number.add(1);
	            // requestスコープに格納
		        request.setAttribute("nullList",nullList );
		        request.setAttribute("error_message",error_message );
		        request.setAttribute("error_number",error_number );
			}
			//日付型例外(システム例外）
			catch(IllegalArgumentException e){
				error_message.add("正しい日付を入力してください");
	        	url = "regist_failure.jsp";
	            e.printStackTrace();
	            System.out.println(error_message);
	            error_number.add(2);
	            // requestスコープに格納
		        request.setAttribute("error_message",error_message );
		        request.setAttribute("error_number",error_number );
		    //その他例外(カタカナ、従業員コード重複、日付）
			}catch(DuplicateException e){
				request.setAttribute("error_message",error_message );
		        request.setAttribute("error_number",error_number );
		        url = "regist_failure.jsp";
			}
	    	break;

		  case "従業員登録":
	     	 // DAO、Beanをインスタンス化
	         ArrayList<EmployeeBean> sectionList = new ArrayList<EmployeeBean>();


	         // DAOからのreturnをBeanに格納
	         try {
	            sectionList = dao.selectSection();
	         } catch(Exception e) {
	             e.printStackTrace();
	         }
	         //現在の日付を取得
	         String today = Regist.getStrToday();
	         System.out.println(today);

	         // requestスコープに格納
	         request.setAttribute("sectionList", sectionList);
	         request.setAttribute("sectionList", sectionList);
	         request.setAttribute("today", today);



	         // 移譲先の指定
	         url = "registEmployee.jsp";
	         break;

        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
	}

}