package entity;

import java.text.DateFormat;
import java.text.ParseException;

public class Regist {
	static public final String DATE_PATTERN = "yyyy-MM-dd";

	public static boolean nullCheck(String obj, boolean error) {
		if (obj.equals(null)) {
			error = true;
		}

		return error;
	}

	public static final String KATAKANA_CODES = "\\u30A0-\\u30FF";

	// 「指定コードのみ」以外とマッチングする正規表現を返す
	public static String toMatchRegex(String codes) {
		return ".*[^" + codes + "].*";
	}

	public static boolean checkDate(String strDate) {

		try {
			if (strDate == null || strDate.length() != 10) {
				throw new Exception();
			}
			strDate = strDate.replace('-', '/');
			DateFormat format = DateFormat.getDateInstance();
			// 日付/時刻解析を厳密に行うかどうかを設定する。
			format.setLenient(false);

			format.parse(strDate);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public static boolean compareToday(String strDate) {// 入力された日付が未来ならfalse、それ以外ならtrueを返す
		try {
			strDate = strDate.replace('-', '/');
			// 現在日付の取得
			java.util.Date today = new java.util.Date();
			java.util.Date date = DateFormat.getDateInstance().parse(strDate);
			// 2つの日付を比較し、結果によってメッセージを変えます
			int diff = today.compareTo(date);
			if (diff < 0) {// 入力が未来の日付
				return false;
			} else {
				return true;
			}
		} catch (ParseException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			return false;
		}

	}

	public static boolean compareDays(String strDate1, String strDate2) {// date2が過去ならfalse、それ以外ならtrueを返す
		try {
			strDate1 = strDate1.replace('-', '/');
			strDate2 = strDate2.replace('-', '/');
			// 現在日付の取得
			java.util.Date date1 = DateFormat.getDateInstance().parse(strDate1);
			java.util.Date date2 = DateFormat.getDateInstance().parse(strDate2);
			// 2つの日付を比較し、結果によってメッセージを変えます
			int diff = date1.compareTo(date2);
			if (diff > 0) {// date2が過去の日付
				return false;
			} else {
				return true;
			}
		} catch (ParseException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			return false;
		}

	}

	public static String getStrToday() {

		java.util.Date today = new java.util.Date();
		return (new java.text.SimpleDateFormat(DATE_PATTERN)).format(today);

	}
	// メモ Timestamp hogeTime = new Timestamp(new
	// SimpleDateFormat("yyyy/MM/dd").parse("2025/02/05").getTime());
}
