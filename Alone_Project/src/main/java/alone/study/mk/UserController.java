package alone.study.mk;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import alone.study.service.UserService;

@Controller
@RequestMapping("/user/**")
public class UserController {

	@Autowired
	private UserService service;

	@RequestMapping("/userProfile")
	public void userProfile(Principal principal, Model model) throws Exception {
		model.addAttribute("userId", principal.getName());
	}
}
