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
import javax.servlet.http.HttpSession;

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
		// TODO Auto-generated method stub
		String url = null;
		// エンコーディング指定
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");

		// JSPよりパラメータを取得
		String action = request.getParameter("ACTION");

		// 使用する値の初期化
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

		// 例外用リスト作成
		ArrayList<String> nullList = new ArrayList<String>();// 未入力項目
		ArrayList<String> error_message = new ArrayList<String>();// 例外時に表示するメッセージ
		ArrayList<Integer> error_number = new ArrayList<Integer>();// 例外判別番号
		ArrayList<Integer> error_tips = new ArrayList<Integer>();// 例外項目番号(0:従業員コード～6：入社日)エラー項目を赤く表示するために使用

		HttpSession reg_session = request.getSession();

		switch (action) {
		case "入力内容を登録":
			try {
				// requestの値を取得
				emp_code = request.getParameter("emp_code");
				l_name = request.getParameter("l_name");
				f_name = request.getParameter("f_name");
				l_kana_name = request.getParameter("l_kana_name");
				f_kana_name = request.getParameter("f_kana_name");
				sex_str = request.getParameter("sex");
				System.out.println(request.getParameter("birth_day"));
				birth_day_str = (String) request.getParameter("birth_day");
				section_name = request.getParameter("section_name");
				emp_date_str = request.getParameter("emp_date");

				// セッションオブジェクトを取得し名前を格納
				// reg_session.setAttribute("error_tips",error_tips );//テスト
				reg_session.setAttribute("emp_code", emp_code);
				reg_session.setAttribute("l_name", l_name);
				reg_session.setAttribute("f_name", f_name);
				reg_session.setAttribute("l_kana_name", l_kana_name);
				reg_session.setAttribute("f_kana_name", f_kana_name);
				reg_session.setAttribute("sex_str", sex_str);
				reg_session.setAttribute("birth_day_str", birth_day_str);
				reg_session.setAttribute("section_name", section_name);
				reg_session.setAttribute("emp_date_str", emp_date_str);

				// null、空文字チェック

				boolean is_null = false;// 未入力エラー判定用
				boolean is_error = false;// その他エラー判定用

				if (emp_code == null || emp_code.length() == 0) {
					nullList.add("従業員コード");
					is_null = true;
					is_error = true;
					error_tips.add(0);
				}
				if (l_name == null || l_name.length() == 0) {
					nullList.add("氏名（姓)");
					is_null = true;
					is_error = true;
					error_tips.add(1);
				}
				if (f_name == null || f_name.length() == 0) {
					nullList.add("氏名（名)");
					is_null = true;
					is_error = true;
					error_tips.add(1);
				}
				if (l_kana_name == null || l_kana_name.length() == 0) {
					nullList.add("氏名（セイ)");
					is_null = true;
					is_error = true;
					error_tips.add(2);
				}
				if (f_kana_name == null || f_kana_name.length() == 0) {
					nullList.add("氏名(メイ)");
					is_null = true;
					is_error = true;
					error_tips.add(2);
				}
				if (sex_str == null || sex_str.length() == 0) {
					nullList.add("性別");
					is_null = true;
					is_error = true;
					error_tips.add(3);
				}
				if (birth_day_str == null || birth_day_str.length() == 0) {
					nullList.add("生年月日");
					is_null = true;
					is_error = true;
					error_tips.add(4);
				}
				if (section_name == null || section_name.length() == 0) {
					nullList.add("部署名");
					is_null = true;
					is_error = true;
					error_tips.add(5);
				}
				if (emp_date_str.equals(null) || emp_date_str.length() == 0) {
					nullList.add("入社日");
					is_null = true;
					is_error = true;
					error_tips.add(6);
				}
				if (is_null) {
					error_message.add("未入力の項目があります");
					error_number.add(1);
					// requestスコープに格納
					request.setAttribute("nullList", nullList);
				}

				employeeList = dao.selectEmployee();// データベースから従業員コードを取得

				// 従業員コード重複判定
				for (int i = 0; i < employeeList.size(); i++) {

					if (emp_code.equals(employeeList.get(i).getCode())) {
						is_error = true;
						error_number.add(3);
						error_message.add("従業員コードが重複しています");
						error_tips.add(0);
					}
				}

				// カタカナ判定
				if (l_kana_name.matches(Regist.toMatchRegex(Regist.KATAKANA_CODES))
						&& f_kana_name.matches(Regist.toMatchRegex(Regist.KATAKANA_CODES))) {
					is_error = true;
					error_number.add(4);
					error_message.add("フリガナはカタカナで入力してください");
					error_tips.add(2);
				}

				Date birth_day = null;
				Date emp_date = null;

				// 日付判定
				if (birth_day_str != null && birth_day_str.length() != 0) {
					if (Regist.checkDate(birth_day_str)) {
						if (Regist.compareToday(birth_day_str)) {
							// エラーなし

						} else {
							is_error = true;
							error_number.add(7);
							error_message.add("生年月日に未来が入力されています:" + birth_day_str);
							error_tips.add(4);
						}
					} else {
						is_error = true;
						error_number.add(5);
						error_message.add("正しい生年月日を入力してください");
						error_tips.add(4);
					}
				}

				if (emp_date_str != null && emp_date_str.length() != 0) {
					if (Regist.checkDate(emp_date_str)) {
						if (Regist.compareToday(emp_date_str)) {
							// エラーなし

						} else {
							is_error = true;
							error_number.add(8);
							error_message.add("入社日に未来が入力されています:" + emp_date_str);
							error_tips.add(6);
						}

					} else {
						is_error = true;
						error_number.add(6);
						error_message.add("正しい入社日を入力してください");
						error_tips.add(6);
					}
				}

				// エラー発生したなら例外スロー
				if (is_error) {
					throw new DuplicateException();
				}

				//// 例外確認終了////

				// 日付をsql.Dateに型変換
				birth_day_str = birth_day_str.replace('/', '-');
				emp_date_str = emp_date_str.replace('/', '-');
				birth_day = Date.valueOf(birth_day_str);
				emp_date = Date.valueOf(emp_date_str);

				byte sex = Byte.parseByte(sex_str);
				// Beanに値をセット
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

				// インサート実行
				dao.insertEmployee(employee);
				url = "successRegistEmployee.jsp";
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
			}

			// 日付型例外(システム例外）
			catch (IllegalArgumentException e) {
				error_message.add("正しい日付を入力してください");
				url = "regist_failure.jsp";
				e.printStackTrace();
				System.out.println(error_message);
				error_number.add(2);
				// requestスコープに格納
				request.setAttribute("error_message", error_message);
				request.setAttribute("error_number", error_number);
				// 例外(未入力、カタカナ、従業員コード重複、日付）
			} catch (DuplicateException e) {

				request.setAttribute("error_message", error_message);
				request.setAttribute("error_number", error_number);
				reg_session.setAttribute("error_tips", error_tips);
				url = "regist_failure.jsp";
			}
			break;

		case "従業員登録":
			// DAO、Beanをインスタンス化
			ArrayList<EmployeeBean> sectionList = new ArrayList<EmployeeBean>();

			// エラー項目表示用
			/*
			 * ArrayList<Integer> tips = new ArrayList<Integer>(); if (
			 * (ArrayList<Integer>)reg_session.getAttribute("error_tips") ==
			 * null){ System.out.println("nullだ"); } tips.add(100);
			 * reg_session.setAttribute("error_tips",tips );
			 */

			// DAOからのreturnをBeanに格納
			try {
				sectionList = dao.selectSection();
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 現在の日付を取得
			String today = Regist.getStrToday();
			System.out.println(today);

			// requestスコープに格納
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