package com.model;

public class AppointmentModel {
	private int appId,jobId,usId,conId;
	private String date,time;
	public AppointmentModel(int appId, int jobId, int usId, int conId, String date, String time) {
		super();
		this.appId = appId;
		this.jobId = jobId;
		this.usId = usId;
		this.conId = conId;
		this.date = date;
		this.time = time;
	}
	public AppointmentModel() {
		super();
	}
	public int getAppId() {
		return appId;
	}
	public void setAppId(int appId) {
		this.appId = appId;
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
	public int getConId() {
		return conId;
	}
	public void setConId(int conId) {
		this.conId = conId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	

}
