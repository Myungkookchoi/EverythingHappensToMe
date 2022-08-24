package alone.study.mk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public void admin() throws Exception {

	}

}
