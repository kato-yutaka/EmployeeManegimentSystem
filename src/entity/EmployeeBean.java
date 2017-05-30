package entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class EmployeeBean implements Serializable {

	private String code; // 従業員コード
	private String name; // 氏名
	private String name_kana; // 氏名(フリガナ)
	private byte sex; // 性別
	private java.sql.Date birth_day; // 生年月日
	private String section_code; // 所属コード
	private java.sql.Date emp_date; // 入社日
	private String l_name; // 氏
	private String f_name; // 名
	private String l_kana_name; // 氏(フリガナ)
	private String f_kana_name; // 名(フリガナ)
	private Timestamp update_date; // 更新日時
	private String section_name; // 所属部署

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName_kana() {
		return name_kana;
	}

	public void setName_kana(String name_kana) {
		this.name_kana = name_kana;
	}

	public byte getSex() {
		return sex;
	}

	public void setSex(byte sex) {
		this.sex = sex;
	}

	public java.sql.Date getBirth_day() {
		return birth_day;
	}

	public void setBirth_day(java.sql.Date birth_day) {
		this.birth_day = birth_day;
	}

	public String getSection_code() {
		return section_code;
	}

	public void setSection_code(String section_code) {
		this.section_code = section_code;
	}

	public java.sql.Date getEmp_date() {
		return emp_date;
	}

	public void setEmp_date(java.sql.Date emp_date) {
		this.emp_date = emp_date;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getL_name() {
		return l_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getF_name() {
		return f_name;
	}

	public void setL_kana_name(String l_kana_name) {
		this.l_kana_name = l_kana_name;
	}

	public String getL_kana_name() {
		return l_kana_name;
	}

	public void setF_kana_name(String f_kana_name) {
		this.f_kana_name = f_kana_name;
	}

	public String getF_kana_name() {
		return f_kana_name;
	}

	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}

	public Timestamp getUpdate_date() {
		return update_date;
	}

	public void setSection_name(String section_name) {
		this.section_name = section_name;
	}

	public String getSection_name() {
		return section_name;
	}
}
