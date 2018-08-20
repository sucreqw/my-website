package com.sucre.common;

/**
 * 构造json数据返回前端
 * 因为功能简单.不需要引入 第三方包,所有自己写个方法
 * @author sucre
 *
 */
public class iJson {
	/**
	 * 
	 * @param data 要放入的数据
	 * @return 一串json数据,code字段和msg字段是固定的.
	 */
      public static String putData(String data) {
    	return "{\"code\":\"100000\",\"msg\":\"succ\",\"data\":\""+ data +"\"}";
      }
}
