package alone.study.mk;

import java.util.Map;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

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

import alone.study.dto.NoticeBoardDto;
import alone.study.dto.ReplyDto;
import alone.study.dto.UserDto;
import alone.study.service.NoticeBoardService;
import alone.study.service.ReplyService;
import alone.study.service.UserService;
import alone.study.vo.PageMaker;

@RestController
@RequestMapping("/restful")
public class RestfulController {

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	UserService service;

	@Autowired
	NoticeBoardService bs;

	@Autowired
	ReplyService rs;

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

	@RequestMapping(value = "/changePassword/{userId}", method = RequestMethod.PUT)
	public ResponseEntity<String> changePassword(@PathVariable("userId") String userId, @RequestBody UserDto dto) {
		ResponseEntity<String> entity = null;
		try {
			dto.setUserPassword(passwordEncoder.encode(dto.getUserPassword()));
			dto.setUserId(userId);
			service.changePassword(dto);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> findId(@RequestBody UserDto dto) throws Exception {
		ResponseEntity<String> entity = null;
		entity = new ResponseEntity<String>(service.findId(dto), HttpStatus.OK);
		return entity;
	}

	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> findPassword(@RequestBody UserDto dto) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		int result = service.findPassword(dto);
		map.put("userId", dto.getUserId());
		map.put("result", result);
		entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		return entity;
	}

	@RequestMapping(value = "/rpdelete", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> rpdelete(@RequestBody ReplyDto dto, Principal principal) throws Exception {
		ResponseEntity<String> entity = null;
		if (principal.getName().equals(dto.getReplyer()) || principal.getName().equals("admin")) {
			rs.delete(dto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;
	}

	@RequestMapping(value = "/page/{page}", method = RequestMethod.GET)
	public ResponseEntity<List<Map<String, NoticeBoardDto>>> pagelist(@PathVariable("page") int pn, PageMaker pm,
			NoticeBoardDto bdto) throws Exception {
		System.out.println(bs.listSearchCriteria(pm));
		ResponseEntity<List<Map<String, NoticeBoardDto>>> entity = null;
//		List<Map<String, NoticeBoardDto>> list = null;
//		Map<String, NoticeBoardDto> map = new HashMap<String, NoticeBoardDto>();
//		pm.setPage(pn);
//		for (int i = 0; i < bs.listSearchCriteria(pm).size(); i++) {
//			map = .get(i);
//		}

		return entity;
	}
}
