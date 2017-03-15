package com.lx.sshiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lx.entity.User;
@Controller
public class UserController {
	@RequestMapping("login")
	public String login(User u){
		  UsernamePasswordToken token=new UsernamePasswordToken(u.getName(),u.getPwd());
		  Subject subject = SecurityUtils.getSubject();
		  try {
			  subject.login(token);
			  return "tt";
		} catch (Exception e) {
			 return "login";
		}	
		 
	}
	@RequiresRoles("store")
	@RequestMapping("toAddBook")
	public String add(){
		
		
		return "addbook";
	}
	@RequiresPermissions("book:update")
	@RequestMapping("toUpdateBook")
	public String update(){
		
		
		return "update";
	}
}
