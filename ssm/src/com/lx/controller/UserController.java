package com.lx.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lx.dao.BaseDao;
import com.lx.model.Module;
import com.lx.model.User;

@RestController
public class UserController {
	@Autowired
	private BaseDao sd;
	@RequestMapping("findAllUsers")
	public  List<User> findUsers(){
			List<User> list=sd.findData();
		return list;
	}
	
	 
	@RequestMapping("deleteUsers")
	public String deleteUsers(@RequestBody ArrayList<Integer> list){
		sd.deleteUsers(list);
		return "1";
	}
	
	
	@RequestMapping("findModuleByUser")
	public List<Module> findModuleByUser(Integer id){
		
		
		return sd.findModuleByUser(id);
	}
	@RequestMapping("findAllModules")
	public List<Module> findAllModules(Integer id){
		//获取所有模块
    	List<Module> rs = sd.findModules();
    	//获取有管理权的模块
    	List<Module> qxrs = sd.findModuleByUser2(id);
         for(Module qm:qxrs){
        	 for(Module m:rs){
        		 
        		if(m.getId()==qm.getId() ){
        			m.setChecked(true);
        		}
        		 
        	 }
         }
         List<Module> rs2=new ArrayList<Module>();
         for(Module m:rs){
        	 if(m.getParentid()==0){
        		 rs2.add(m);
        	 }
         }
   
    	return rs2;
	}
	
	
	
	@RequestMapping("findModuleByPid")
	public List<Module> findModuleByPid(Integer id){
		
		
		return sd.findModuleByPid(id);
	}
	
}
