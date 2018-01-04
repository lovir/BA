package com.example.spring02.model.payment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.spring02.model.payment.dto.PaymentVO;
import com.example.spring02.model.sales.dto.SalesVO;

public interface PaymentDAO {

	public void insertPayment(PaymentVO vo);
	public List<PaymentVO> selectAll(String userId);
	public PaymentVO detailView(int seq);
	public void deletePayment(int seq);
	public void updatePayment(PaymentVO vo);
	//public int sumRegist(String user_id);
	public List<HashMap> sumRegist(String user_id);
	public List<HashMap> sumSales(String user_id);
	public List<HashMap> sumPayment(String user_id);
	public List<HashMap> sumEtc(String user_id);
	public List<PaymentVO> selectPayment(String user_id);
	public List<SalesVO> selectSales(String user_id, int pid);
	public List<PaymentVO> paymentList(int start, int end, String status);
	public void completePayment(PaymentVO vo);
	public void completeSales(PaymentVO vo);
	public int countPaymentList(String status);
}
