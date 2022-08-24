package alone.study.mk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import alone.study.service.UserService;

@Controller
public class HomeController {

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	UserService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homeGET() {

		return "main";
	}

	@RequestMapping(value = "/main", method = { RequestMethod.GET, RequestMethod.POST })
	public void main() {

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void userLoginGET() throws Exception {

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void userLoginPOST() throws Exception {

	}
}
