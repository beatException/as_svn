package com.lx.model;

import java.util.HashSet;
import java.util.Set;

public class Module {
	private int id;
	private String text;
	private String url;
	private boolean checked=false;
	private int parentid;
	
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	private Set<Module> children=new HashSet<Module>();
	
	
 
	public Set<Module> getChildren() {
		return children;
	}
	public void setChildren(Set<Module> children) {
		this.children = children;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
 
	}
	
	
