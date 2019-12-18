package controller;

import java.util.ArrayList;

public class BaseController {
	
	public static String ToJSArray(ArrayList<String> array) {
        if(array==null || array.isEmpty())
            return "";
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < array.size(); i++) {
            sb.append("\"").append(array.get(i)).append("\"");
            if (i + 1 < array.size()) {
                sb.append(",");
            }
        }
        sb.append("]");
        return sb.toString();
    }
	
	public static String[] ToStringArray(String items){
		return items.split(",");
	}
}
