package com.karlsruhe.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.karlsruhe.board.BoardService;
import com.karlsruhe.notice.NoticeService;
import com.karlsruhe.photo.PhotoService;
import com.karlsruhe.users.UsersService;
import com.karlsruhe.weekly.WeeklyService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private PhotoService photoService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private WeeklyService WeeklyService;
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/admin")
	public String admin() {
		
		
		
		return "admin/admin";
	}
	
	
	@GetMapping("/memberlist")
	public String memberlist(Model model) {
		
		model.addAttribute("members", usersService.memberList());
		model.addAttribute("users", sqlSessionTemplate.selectList("admin.userlist"));
		
		
		return "admin/memberlist";
	}
	

}
