package entity;

public class Regist {

	public static boolean  nullCheck (String obj, boolean error){
		if(obj.equals(null)){
			error = true;
		}

		return error;
	}

	// メモ　Timestamp hogeTime = new Timestamp(new SimpleDateFormat("yyyy/MM/dd").parse("2025/02/05").getTime());
}

