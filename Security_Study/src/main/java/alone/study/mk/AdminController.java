package alone.study.mk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import alone.study.service.UserService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private UserService service;

	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String userList(Model model) throws Exception {
		model.addAttribute("list", service.userList());
		return "/admin/userList";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public void admin() throws Exception {

	}
}
