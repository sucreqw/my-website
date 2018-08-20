package com.sucre.common;

import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;

/**
 * 这个web项目的工具类
 * @author sucre
 *
 */
public class webUtils {
	
	
    public static boolean isEmpty(String data) {
    	return (data==null ||data.trim().length()==0)? true:false;
    }
    public static boolean isEmpty(String[] data) {
    	return (data==null ||data.length==0)? true:false;
    }
    /**
     * 去除字符串里的换行符还有空格!
     * @param data
     * @return
     */
    public static String trims(String data) {
    	return data.trim().replaceAll("\t|\r|\n", "");
    }
    public static String getCookie(Cookie[] cookies,String key) {
        if(cookies==null) {return "";}
    	for(int i=0;i<cookies.length;i++) {
    	     	if(key.equals(cookies[i].getName())) {
    	     		return cookies[i].getValue();
    	     	}
    	}
    	return "";
    }
    
    private static int trimP(String page) {
    	if ("0".equals(page)||Integer.parseInt(page)<0) {
			page = "1";
		}
    	int p = Integer.valueOf(page);
    	return p;
    }
    public static String pageUp(String page) {
    	int p=trimP(page);
    	
    	String up = String.valueOf(p * 20);
		return up;
    }
    public static String pageLow(String page) {
    	int p=trimP(page);
		//String up = String.valueOf(p * 20);
		String low = String.valueOf((p * 20) - 20);
    	return low;
    	
    }
    /**
     * 把对象list转成string 返回前端!
     * @param 对象类
     * @return
     */
    public static String getEntity(List<?> weibo) {
    	StringBuilder data = new StringBuilder(200);
    	for (int i = 0; i < weibo.size(); i++) {
			data.append(weibo.get(i));
		}
		return data.toString();
    	
    }
    
    public static String[] splitData(String data) {
    	data=data.replaceAll("<td>", "");
    	data=data.replaceAll("true", "1");
    	data=data.replaceAll("false", "0");
		String[] s=data.split("</td>");
		return s;
    }
    
    public static String dateToStrLong(Date dateDate) {
		   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   String dateString = formatter.format(dateDate);
		   return dateString;
		}
    
    
    /**
	  * 截取字符中所有的指定字符
	 * 
	 * @param start   要截取字符的开始位置
	 * @param ends    要截取字符的结束位置
	 * @param str2mid 源字符串
	 * @return 返回start 和ends 所包含位置的字符串,以"|"分割!
	 */
	public static ArrayList<String> midWordAll(String start,String ends,String str2mid) {
		if(isEmpty(str2mid)) {return null;}
		//StringBuilder ret=new StringBuilder(str2mid.length());
		ArrayList<String> ret=new ArrayList<>();
		int i=0;
		String[] back=null;
		while((back=midWord(start,ends,str2mid,i))!=null) {
	    i=Integer.parseInt(back[1]);
		ret.add(back[0]);
	    }
		return ret;
	}
	/**
	 * 截取某一段字符
	 * 
	 * @param start   要截取字符的开始位置
	 * @param ends    要截取字符的结束位置
	 * @param str2mid 源字符串
	 * @return 返回start 和ends 所包含位置的字符串
	 */
	public static String midWord(String start, String ends, String str2mid) {
		String[] ret=midWord(start,ends,str2mid,0);
		if(ret==null) {return null;}
		return ret[0];
	}
   /**
    * 截取某一段字符
	 * 
	 * @param start   要截取字符的开始位置
	 * @param ends    要截取字符的结束位置
	 * @param str2mid 源字符串
	 * @param starts 开始查找的位置
	 * @return 返回start 和ends 所包含位置的字符串
    */
	public static String[] midWord(String start,String ends,String str2mid,int starts) {
		int begin, last;
		if ("".equals(str2mid)) {
			return null;
		}
		begin = str2mid.indexOf(start,starts);
		// 找到字符
		if (begin != -1) {
			last = str2mid.indexOf(ends, begin + start.length());
			if (last != -1) {
				String ret = str2mid.substring(begin + start.length(), last);
				starts=last;
				return new String[]{ret,String.valueOf(last)};
			}
		}
       return null;
   }
	
	public static String MD5(String key) {
        char hexDigits[] = {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
        };
        try {
            byte[] btInput = key.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str).toLowerCase();
        } catch (Exception e) {
            return null;
        }
    }
	
	public static String getIndex(int index,String[] source) {
		if(index < source.length) {
			return source[index];
		}
		return "";
	}
    
}
