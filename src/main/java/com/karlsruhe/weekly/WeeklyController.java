package com.karlsruhe.weekly;

import java.util.Map;
import java.util.UUID;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@RequestMapping("/weekly")
@Controller
public class WeeklyController {
	
	@Autowired
	private WeeklyService weeklyService;
	
	
	@GetMapping("/create")
	public String create() {
		return "weekly/create";
	}

	@PostMapping("/create")
	public String create(@RequestParam Map<String, Object> map) {

	
			weeklyService.create(map);
			return "redirect:/weekly/readList";
		}
		
		@GetMapping("/readList")
		public String readList(Model model) {
			model.addAttribute("lists", weeklyService.readList());
			return "weekly/readList";
		}
		
		@GetMapping("/readDetail")
		public String readDetail(@RequestParam("gid") String gid, Model model) {
			model.addAttribute("details", weeklyService.readDetail(gid));
			
			return "weekly/readDetail";
		}
		
		@GetMapping("/update")
		public String updateform(@RequestParam("gid") String gid, Model model) {

			model.addAttribute("details", weeklyService.readDetail(gid));

			return "weekly/update";
		}
		
		
		@PostMapping("/update")
		public String update(@RequestParam Map<String, Object> map) {

			
			weeklyService.update(map);

			return "redirect:/weekly/readList";
		}
		
		
		
		@GetMapping("/delete")
		public String delete(@RequestParam("gid") String gid) {
			weeklyService.delete(gid);
			return "redirect:/weekly/readList";
		}

}
