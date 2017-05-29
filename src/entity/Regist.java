package entity;

import java.text.DateFormat;
import java.text.ParseException;

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

	 public static boolean checkDate(String strDate) {
	        if (strDate == null || strDate.length() != 10) {
	            throw new IllegalArgumentException(
	                    "引数の文字列["+ strDate +"]" +
	                    "は不正です。");
	        }
	        strDate = strDate.replace('-', '/');
	        DateFormat format = DateFormat.getDateInstance();
	        // 日付/時刻解析を厳密に行うかどうかを設定する。
	        format.setLenient(false);
	        try {
	            format.parse(strDate);
	            return true;
	        } catch (Exception e) {
	            return false;
	        }
	 }
	 public static boolean compareToday(String strDate) {
	 try {
		 strDate = strDate.replace('-', '/');
		 //現在日付の取得
	        java.util.Date today = new java.util.Date();
			java.util.Date date = DateFormat.getDateInstance().parse(strDate);
			 // 2つの日付を比較し、結果によってメッセージを変えます
            int diff = today.compareTo(date);
            if (diff < 0) {//入力が過去の日付
            	return true;
            } else{
            	return false;
            }
         } catch (ParseException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			return false;
		}

	 }
	// メモ　Timestamp hogeTime = new Timestamp(new SimpleDateFormat("yyyy/MM/dd").parse("2025/02/05").getTime());
}

