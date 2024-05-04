package com.servlet;

import javax.servlet.http.HttpServletRequest;

public class servletUtil {
	public static String getPreviousPage(HttpServletRequest request) {
		String referer = request.getHeader("referer");
		String prevJsp = "";
		if (referer != null) {
            // Giải phân tích URL để lấy tên trang JSP gần nhất
            String[] parts = referer.split("/");
            prevJsp = parts[parts.length - 1];
            
		}
		
		return prevJsp;
	}
}
