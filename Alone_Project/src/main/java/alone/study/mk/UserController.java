package alone.study.mk;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/**")
public class UserController {

	@RequestMapping("/userProfile")
	public void userProfile(Principal principal, Model model) throws Exception {
		model.addAttribute("userId", principal.getName());
	}
}
