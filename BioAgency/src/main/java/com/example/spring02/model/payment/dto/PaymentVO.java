package com.example.spring02.model.payment.dto;
 
import java.sql.Date;

public class PaymentVO {
	private int seq;
	private int sales_seq;
	private String sales_member_name;
	private String product_name;
	private String purchase_name;
	private String purchase_date;
	private Date amount_date;
	private String member_id;
	private String member_name;
	private int payment_amount;
	private String account;
	private String status;
	private Date regdate;
	private Date updatedate;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public Date getAmount_date() {
		return amount_date;
	}
	public void setAmount_date(Date amount_date) {
		this.amount_date = amount_date;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(int payment_amount) {
		this.payment_amount = payment_amount;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getSales_seq() {
		return sales_seq;
	}
	public void setSales_seq(int sales_seq) {
		this.sales_seq = sales_seq;
	}
	public String getSales_member_name() {
		return sales_member_name;
	}
	public void setSales_member_name(String sales_member_name) {
		this.sales_member_name = sales_member_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getPurchase_name() {
		return purchase_name;
	}
	public void setPurchase_name(String purchase_name) {
		this.purchase_name = purchase_name;
	}
	public String getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}
}
