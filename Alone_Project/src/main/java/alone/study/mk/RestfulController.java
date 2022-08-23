package alone.study.mk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alone.study.dto.UserDto;
import alone.study.service.UserService;

@RestController
@RequestMapping("/restful")
public class RestfulController {

	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	UserService service;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGet() throws Exception {
		System.out.println("******GET register");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public int register(@RequestBody UserDto dto) throws Exception {
//		ResponseEntity<String> entity = null;
		System.out.println(dto);
		int result;
		try {
			service.create(dto);
			result = 0;
//			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = 1;
//			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return result;
	}

	@RequestMapping(value = "/checkid", method = RequestMethod.GET)
	@ResponseBody
	public int checkidGET(String userId) throws Exception {
		System.out.println("******GET Checkid");
		System.out.println(userId);
		int result = service.checkid(userId);
		return result;
	}

	@RequestMapping(value = "/checkid", method = RequestMethod.POST)
	@ResponseBody
	public int checkid(@RequestBody UserDto dto) throws Exception {
		System.out.println("******POST Checkid");
		System.out.println(dto);
		int result = service.checkid(dto.getUserId());
		System.out.println(result);
		return result;
	}
}
