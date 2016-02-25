package com.dts.btisqr.model;

import java.sql.Date;

import com.dts.core.dao.AbstractDataAccessObject;

public class Bug {
	
	int bugID;
	int priorityID;
	String priorityName;
	String bugName;
	String raisedDate;
	Date raisedDate1;
	String raisedBy;
	String status;
	int projectID;
	String description;
	String assignedDate;
	Date assignedDate1;
	String AssignedTo;
	String solvedBy;
	String solvedDate;
	Date solvedDate1;
	String solution;
	public int getBugID() {
		return bugID;
	}
	public void setBugID(int bugID) {
		this.bugID = bugID;
	}
	public int getPriorityID() {
		return priorityID;
	}
	public void setPriorityID(int priorityID) {
		this.priorityID = priorityID;
	}
	public String getPriorityName() {
		return priorityName;
	}
	public void setPriorityName(String priorityName) {
		this.priorityName = priorityName;
	}
	public String getBugName() {
		return bugName;
	}
	public void setBugName(String bugName) {
		this.bugName = bugName;
	}
	public String getRaisedDate() {
		return raisedDate;
	}
	public void setRaisedDate(String raisedDate) {
		this.raisedDate = raisedDate;
	}
	public Date getRaisedDate1() {
		return raisedDate1;
	}
	public void setRaisedDate1(Date raisedDate1) {
		this.raisedDate1 = raisedDate1;
	}
	public String getRaisedBy() {
		return raisedBy;
	}
	public void setRaisedBy(String raisedBy) {
		this.raisedBy = raisedBy;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAssignedDate() {
		return assignedDate;
	}
	public void setAssignedDate(String assignedDate) {
		this.assignedDate = assignedDate;
	}
	public Date getAssignedDate1() {
		return assignedDate1;
	}
	public void setAssignedDate1(Date assignedDate1) {
		this.assignedDate1 = assignedDate1;
	}
	public String getAssignedTo() {
		return AssignedTo;
	}
	public void setAssignedTo(String assignedTo) {
		AssignedTo = assignedTo;
	}
	public String getSolvedBy() {
		return solvedBy;
	}
	public void setSolvedBy(String solvedBy) {
		this.solvedBy = solvedBy;
	}
	public String getSolvedDate() {
		return solvedDate;
	}
	public void setSolvedDate(String solvedDate) {
		this.solvedDate = solvedDate;
	}
	public Date getSolvedDate1() {
		return solvedDate1;
	}
	public void setSolvedDate1(Date solvedDate1) {
		this.solvedDate1 = solvedDate1;
	}
	public String getSolution() {
		return solution;
	}
	public void setSolution(String solution) {
		this.solution = solution;
	}
	public void setProjectID(int projectID) {
		this.projectID = projectID;
	}
	public int getProjectID() {
		return projectID;
	}
}
