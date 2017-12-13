package com.example.spring02.model.payment.dao;

import java.util.List;

import com.example.spring02.model.payment.dto.PaymentVO;
import com.example.spring02.model.sales.dto.SalesVO;

public interface PaymentDAO {

	public void insertPayment(PaymentVO vo);
	public List<PaymentVO> selectAll();
	public PaymentVO detailView(int seq);
	public void deletePayment(int seq);
	public void updatePayment(PaymentVO vo);
	public int sumRegist(String user_id);
	public int sumSales(String user_id);
	public int sumPayment(String user_id);
	public int sumEtc(String user_id);
	public List<PaymentVO> selectPayment(String user_id);
	public List<SalesVO> selectSales(String user_id, int pid);
}
