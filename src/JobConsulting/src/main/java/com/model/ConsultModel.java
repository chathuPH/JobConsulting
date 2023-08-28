package com.model;

public class ConsultModel {
	private int id,jobId,usId;
	private String conDate,conTime;
	public ConsultModel(int id, int jobId, int usId, String conDate, String conTime) {
		super();
		this.id = id;
		this.jobId = jobId;
		this.usId = usId;
		this.conDate = conDate;
		this.conTime = conTime;
	}
	public ConsultModel() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public int getUsId() {
		return usId;
	}
	public void setUsId(int usId) {
		this.usId = usId;
	}
	public String getConDate() {
		return conDate;
	}
	public void setConDate(String conDate) {
		this.conDate = conDate;
	}
	public String getConTime() {
		return conTime;
	}
	public void setConTime(String conTime) {
		this.conTime = conTime;
	}
	
	
}
