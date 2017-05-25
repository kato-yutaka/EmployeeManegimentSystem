package entity;

import java.io.Serializable;

public class EmployeeBean implements Serializable {

	private String code;
	private String name;
	private String name_kana;
	private byte  sex;
	private java.sql.Date birth_day;
    private String section_code;
    private java.sql.Timestamp emp_date;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName(){
    	return name;
    }

    public void setName(String name){
    	this.name = name;
    }

    public String getName_kana() {
        return name_kana;
    }

    public void setName_kana(String name_kana) {
        this.name_kana = name_kana;
    }

    public byte getSex(){
    	return sex;
    }

    public void setSex(byte sex){
    	this.sex = sex;
    }

    public java.sql.Date getBirth_day() {
    	return birth_day;
    }

    public void setBirth_day(java.sql.Date birth_day){
    	this.birth_day = birth_day;
    }

    public String getSection_code(){
    	return section_code;
    }

    public void setSection_code(String section_code){
    	this.section_code = section_code;
    }

    public java.sql.Timestamp getemp_date(){
    	return emp_date;
    }

    public void setemp_date(java.sql.Timestamp emp_date){
    	this.emp_date = emp_date;
    }
}
