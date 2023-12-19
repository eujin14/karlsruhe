package com.karlsruhe.notice;


import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RequestMapping("/notice")
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	
	@GetMapping("/create")
	public String create() {
		return "notice/create";
	}

	@PostMapping("/create")
	public String create(@RequestParam Map<String, Object> map) {

		noticeService.create(map);
		return "redirect:/notice/readList";
	}

	@GetMapping("/readList")
	public String readList(Model model) {
		model.addAttribute("lists", noticeService.readList());
		return "notice/readList";
	}

	@GetMapping("/readDetail")
	public String readDetail(@RequestParam("nid") String nid, Model model) {
		model.addAttribute("details", noticeService.readDetail(nid));
		
		return "notice/readDetail";
	}

	@GetMapping("/update")
	public String updateform(@RequestParam("nid") String nid, Model model) {

		model.addAttribute("details", noticeService.readDetail(nid));

		return "notice/update";
	}

	@PostMapping("/update")
	public String update(@RequestParam Map<String, Object> map) {

	
		noticeService.update(map);

		return "redirect:/notice/readList";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("nid") String nid) {
		noticeService.delete(nid);
		return "redirect:/notice/readList";
	}

	
	 
	
}
