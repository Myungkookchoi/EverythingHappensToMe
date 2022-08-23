package alone.study.mk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import alone.study.service.UserService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private UserService service;

	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public void admin() throws Exception {

	}

}
