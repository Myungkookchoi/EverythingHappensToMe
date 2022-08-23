package alone.study.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import alone.study.service.UserService;

public class LoginFailureHandler implements AuthenticationFailureHandler {

	@Autowired
	private UserService service;

	private String loginidname;
	private String loginpwname;
	private String errormsgname;
	private String defaultFailureUrl;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");

		String username = request.getParameter(loginidname);
		String password = request.getParameter(loginpwname);
		String errormsg = null;
		try {
			if (service.checkid(username) == 0) {
				errormsg = "존재하지 않는 아이디입니다.";
			} else {
				if (exception instanceof BadCredentialsException) {
					System.out.println(exception);
					errormsg = "비밀번호가 일치하지 않습니다.";
				} else if (exception instanceof DisabledException) {
					errormsg = "승인되지 않은 아이디입니다.";
				}
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		request.setAttribute(loginidname, username);
		request.setAttribute(loginpwname, password);
		request.setAttribute(errormsgname, errormsg);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}

	public String getLoginidname() {
		return loginidname;
	}

	public void setLoginidname(String loginidname) {
		this.loginidname = loginidname;
	}

	public String getLoginpwname() {
		return loginpwname;
	}

	public void setLoginpwname(String loginpwname) {
		this.loginpwname = loginpwname;
	}

	public String getErrormsgname() {
		return errormsgname;
	}

	public void setErrormsgname(String errormsgname) {
		this.errormsgname = errormsgname;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

}
