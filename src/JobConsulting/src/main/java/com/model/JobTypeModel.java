package com.model;

public class JobTypeModel {

	private int id;
	private String name;
	
	public JobTypeModel(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public JobTypeModel() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
