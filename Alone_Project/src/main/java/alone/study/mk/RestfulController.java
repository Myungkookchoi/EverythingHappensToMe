package alone.study.mk;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> register(@RequestBody UserDto dto) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			dto.setUserPassword(passwordEncoder.encode(dto.getUserPassword()));
			service.create(dto);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/checkid", method = RequestMethod.GET)
	@ResponseBody
	public int checkidGET(String userId) throws Exception {
		int result = service.checkid(userId);
		return result;
	}

	@RequestMapping(value = "/checkid", method = RequestMethod.POST)
	@ResponseBody
	public int checkid(@RequestBody UserDto dto) throws Exception {
		int result = service.checkid(dto.getUserId());
		return result;
	}

	@RequestMapping(value = "/profile/{userId}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, UserDto>> profile(@PathVariable("userId") String userId) throws Exception {
		ResponseEntity<Map<String, UserDto>> entity = null;
		Map<String, UserDto> map = new HashMap<String, UserDto>();
		UserDto dto = service.userDetail(userId);
		map.put("detail", dto);
		entity = new ResponseEntity<Map<String, UserDto>>(map, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/{userId}", method = RequestMethod.PUT)
	public ResponseEntity<String> edit(@PathVariable("userId") String userId, @RequestBody UserDto dto) {
		ResponseEntity<String> entity = null;
		try {
			dto.setUserPassword(passwordEncoder.encode(dto.getUserPassword()));
			service.update(dto);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
