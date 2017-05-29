package entity;

import java.io.Serializable;

public class UserBean implements Serializable {

	private String user_id;
	private String password;
	private String update_date;

	//user_idのgetter,setter
	public String getUserId() {
        return user_id;
    }

    public void setUserId(String user_id) {
        this.user_id = user_id;
    }

    //passwordのgetter,setter
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    //update_dataのgetter,setter
    public String getUpdatedate() {
        return update_date;
    }

    public void setUpdatedate(String update_date) {
        this.update_date = update_date;
    }

}
