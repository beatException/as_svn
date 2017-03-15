package com.lx.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.lx.model.Module;
import com.lx.model.User;

@Repository
public interface BaseDao {
	public List<User> findData();
	public User findData2(int id);
	public boolean addUser(User u);
	public List<Module> findModuleByPid(int id);
	public boolean deleteUsers(ArrayList<Integer> list);
	public User login(User u);
	public List<Module> findModuleByUser(int id);
	public List<Module> findModules();
	public List<Module> findModuleByUser2(int id);
}
