package kr.jboard2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonService {

	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	
}
