package com.example.spring02.service.payment;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.spring02.model.payment.dto.PaymentVO;
import com.example.spring02.model.sales.dto.SalesVO;

public interface PaymentService {
	public List<PaymentVO> list(HttpSession session);
	public Object read(int seq);
	public void delete(int seq);
	public void update(PaymentVO vo);
	//public int sumRegist(HttpSession session);
	public List<HashMap> sumRegist(HttpSession session);
	public List<HashMap> sumSales(HttpSession session);
	public List<HashMap> sumPayment(HttpSession session);
	public List<HashMap> sumEtc(HttpSession session);
	public List<PaymentVO> selectPayment(HttpSession session);
	public List<SalesVO> selectSales(HttpSession session, int pid);
	public List<PaymentVO> paymentList(int start, int end, String status);
	public void completePayment(PaymentVO vo);
	public void completeSales(PaymentVO vo);
	public int countPaymentList(String status);
}
