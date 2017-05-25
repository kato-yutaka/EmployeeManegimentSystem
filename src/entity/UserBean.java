package entity;

import java.io.Serializable;

public class UserBean implements Serializable {

	private String user_id;
	private String password;
	private String update_data;

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
    public String getUpdatedata() {
        return update_data;
    }

    public void setUpdatedata(String update_data) {
        this.update_data = update_data;
    }

}
