package com.example.spring02.model.payment.dao;

import java.util.List;

import com.example.spring02.model.payment.dto.PaymentVO;

public interface PaymentDAO {

	public void insertPayment(PaymentVO vo);
	public List<PaymentVO> selectAll();
	public PaymentVO detailView(int seq);
	public void deletePayment(int seq);
	public void updatePayment(PaymentVO vo);
}
