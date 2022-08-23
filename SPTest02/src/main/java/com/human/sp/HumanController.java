package com.human.sp;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.human.service.HobbyService;
import com.human.service.HumanService;
import com.human.dto.HobbyDto;
import com.human.dto.HumanDto;

@Controller
public class HumanController {

	@Inject
	private HumanService service;

	@Inject
	private HobbyService hobbyService;

	@RequestMapping(value = "/human/information", method = RequestMethod.GET)
	public void list(HumanDto dto, Model model) throws Exception {
		List<HumanDto> list = service.list();
		for (HumanDto humanDto : list) {
			humanDto.setHobby(hobbyService.list(humanDto.getName()));
		}
		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/human/joinForm", method = RequestMethod.GET)
	public void create(Model model) throws Exception {

	}

	@RequestMapping(value = "/human/joinForm", method = RequestMethod.POST)
	public String create(String name, String[] hobbys, HumanDto dto, Model model, RedirectAttributes rttr)
			throws Exception {
		service.create(dto);

		for (String hobby : hobbys) {
			HobbyDto hdto = new HobbyDto();
			hdto.setName(name);
			hdto.setHobby(hobby);
			hobbyService.create(hdto);
		}

		rttr.addFlashAttribute("msg", "success");
		return "redirect:/human/information";
	}

	@RequestMapping(value = "/human/deleteForm", method = RequestMethod.GET)
	public void delete(HumanDto dto, Model model) throws Exception {

	}

	@RequestMapping(value = "/human/deleteForm", method = RequestMethod.POST)
	public String delete(@RequestParam("name") String name, HumanDto dto, RedirectAttributes rttr) throws Exception {
		hobbyService.delete(name);
		service.delete(name);
		rttr.addFlashAttribute("msg", "success");
		rttr.addFlashAttribute("name", dto.getName());
		return "redirect:/human/deleteForm";
	}

	@RequestMapping(value = "/human/editForm", method = RequestMethod.GET)
	public void edit(HumanDto dto, Model model) throws Exception {

	}

	@RequestMapping(value = "/human/editForm", method = RequestMethod.POST)
	public String edit(String[] hobbys, HumanDto dto, Model model, RedirectAttributes rttr) throws Exception {
		service.update(dto);
//		hobbyService.update(hobby);
		hobbyService.delete(dto.getName());

		for (String hobby : hobbys) {
			HobbyDto hdto = new HobbyDto();
			hdto.setName(dto.getName());
			hdto.setHobby(hobby);
			hobbyService.create(hdto);
		}

		rttr.addFlashAttribute("msg", "success");
		rttr.addFlashAttribute("id", dto.getName());
		return "redirect:/human/editForm";
	}

	@RequestMapping(value = "/human/read", method = RequestMethod.GET)
	public void read(@RequestParam("name") String name, HumanDto dto, Model model) throws Exception {
		model.addAttribute(service.read(name));
		model.addAttribute("hlist", hobbyService.read(name));

		for (int i = 0; i < hobbyService.read(name).size(); i++) {
			String hobby = hobbyService.read(name).get(i).getHobby();
			if (hobby.equals("영화")) {
				model.addAttribute("movie", hobby);
				continue;
			} else if (hobby.equals("운동")) {
				model.addAttribute("exercise", hobby);
				continue;
			} else if (hobby.equals("독서")) {
				model.addAttribute("read", hobby);
				continue;
			} else if (hobby.equals("요리")) {
				model.addAttribute("cooking", hobby);
				continue;
			} else if (hobby.equals("음악")) {
				model.addAttribute("music", hobby);
				continue;
			}
		}
		model.addAttribute("size", hobbyService.read(name).size());
//		System.out.println(hobbyService.read(name).get(0).getHobby());
	}
}
