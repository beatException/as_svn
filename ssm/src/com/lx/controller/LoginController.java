package com.lx.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lx.dao.BaseDao;
import com.lx.model.User;

@Controller
public class LoginController {
	@Autowired
	private BaseDao sd;

	@RequestMapping("login")
	public String login(User u, Model m) {

		String str = "main";
		try {
			User user = sd.login(u);
			user.getId();
			m.addAttribute("u",user);
		} catch (Exception e) {
			str = "admin";
			m.addAttribute("msg", "√‹¬ÎªÚ’ﬂµ«¬Ω“Ï≥££°");
		}
		return str;
	}

}
