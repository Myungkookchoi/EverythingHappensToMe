package alone.study.mk;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alone.study.dto.UserDto;
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

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserDto dto, RedirectAttributes rttr) throws Exception {
		System.out.println(dto);
		dto.setUserPassword(passwordEncoder.encode(dto.getUserPassword()));
		service.create(dto);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/";
	}
}
