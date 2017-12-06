package com.example.spring02.service.payment;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.spring02.model.payment.dto.PaymentVO;

public interface PaymentService {
	public List<PaymentVO> list(HttpSession session);
	public Object read(int seq);
	public void delete(int seq);
	public void update(PaymentVO vo);

}
