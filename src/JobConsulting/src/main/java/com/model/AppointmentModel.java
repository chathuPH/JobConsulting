package com.model;

public class AppointmentModel {
	private int appId,jobId,usId,conId;
	private String date,time,jobName,ConsultName,appUserName,state;
	
	public AppointmentModel(int appId, int jobId, int usId, int conId, String date, String time, String jobName,
			String consultName, String appUserName,String state) {
		super();
		this.appId = appId;
		this.jobId = jobId;
		this.usId = usId;
		this.conId = conId;
		this.date = date;
		this.time = time;
		this.jobName = jobName;
		ConsultName = consultName;
		this.appUserName = appUserName;
		this.state = state;
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

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getConsultName() {
		return ConsultName;
	}

	public void setConsultName(String consultName) {
		ConsultName = consultName;
	}

	public String getAppUserName() {
		return appUserName;
	}

	public void setAppUserName(String appUserName) {
		this.appUserName = appUserName;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
	
	
}
