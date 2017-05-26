package entity;

public class Regist {

	public static boolean  nullCheck (String obj, boolean error){
		if(obj.equals(null)){
			error = true;
		}

		return error;
	}
	public static final String KATAKANA_CODES = "\\u30A0-\\u30FF";

	//「指定コードのみ」以外とマッチングする正規表現を返す
	public static String toMatchRegex(String codes) {
		return ".*[^" + codes + "].*";
	}

	// メモ　Timestamp hogeTime = new Timestamp(new SimpleDateFormat("yyyy/MM/dd").parse("2025/02/05").getTime());
}

