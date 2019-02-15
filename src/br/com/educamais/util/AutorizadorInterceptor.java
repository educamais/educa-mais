package br.com.educamais.util;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws IOException {
		
		if (request.getSession().getAttribute("usuario") != null) {
			return true;
		}
		
		String uri = request.getRequestURI();
		
		if (uri.contains("resources") ||
			uri.endsWith("/educa-mais/autenticar") || 
			uri.endsWith("/educa-mais/save") ||
			uri.endsWith("/educa-mais/mensagem")) {
			
			return true;
		}
		
		response.sendRedirect("/educa-mais/");
		return false;
	}
}
