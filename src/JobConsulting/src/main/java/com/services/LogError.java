package com.services;

public class LogError {
	private static LogError instance;
	private LogError() {
    }
	
	public static LogError getInstance() {
        if (instance == null) {
            instance = new LogError();
        }
        return instance;
    }
	
	public static void LogToConsole(String err) {
        System.out.println("Error: " + err);
	}
}
