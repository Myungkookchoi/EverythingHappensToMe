package alone.study.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import alone.study.service.UserService;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	private UserService service;

	private String loginId;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		List<String> roleNames = new ArrayList<String>();

		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});

		String userId = request.getParameter(loginId);
		try {
			request.setAttribute("userName", service.userName(userId));
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/mk/main");
			return;
		}
		if (roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/mk/main");
			return;
		}
		if (roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/mk/main");
			return;
		}
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

}
