package alone.study.mk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alone.study.dto.UserDto;
import alone.study.service.UserService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private UserService service;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public void admin() throws Exception {

	}

	@RequestMapping(value = "/authority/userList", method = RequestMethod.GET)
	public void userList(Model model) throws Exception {
		model.addAttribute("list", service.userList());
		model.addAttribute("noEnabled", service.noEnabledUserList());
	}

	@RequestMapping(value = "/authority/userDetail", method = RequestMethod.GET)
	public void userDetailGET(@RequestParam("userId") String userId, Model model) throws Exception {
		model.addAttribute("detail", service.userDetail(userId));
	}

	@RequestMapping(value = "/authority/userDetail", method = RequestMethod.POST)
	public String userDetailPOST(UserDto dto, Model model, RedirectAttributes rttr) throws Exception {
		service.upgradeuser(dto);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/authority/userList";
	}

}
