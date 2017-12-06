package com.example.spring02.model.sales.dto;

import java.sql.Date;

public class SalesVO {
	
	private int seq;
	private String purchase_date;
	private String expected_date;
	private String sales_member;
	private int pid;
	private String product_name;
	private String purchase_name;
	private int purchase_amount;
	private String upper_member;
	private int upper_amount;
	private String status;
	private Date regdate;
	private Date updatedate;

	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}
	public String getSales_member() {
		return sales_member;
	}
	public void setSales_member(String sales_member) {
		this.sales_member = sales_member;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPurchase_amount() {
		return purchase_amount;
	}
	public void setPurchase_amount(int purchase_amount) {
		this.purchase_amount = purchase_amount;
	}
	public String getUpper_member() {
		return upper_member;
	}
	public void setUpper_member(String upper_member) {
		this.upper_member = upper_member;
	}
	public int getUpper_amount() {
		return upper_amount;
	}
	public void setUpper_amount(int upper_amount) {
		this.upper_amount = upper_amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getPurchase_name() {
		return purchase_name;
	}
	public void setPurchase_name(String purchase_name) {
		this.purchase_name = purchase_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getExpected_date() {
		return expected_date;
	}
	public void setExpected_date(String expected_date) {
		this.expected_date = expected_date;
	}
	
}
