package com.example.spring02.service.payment;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.spring02.model.payment.dao.PaymentDAO;
import com.example.spring02.model.payment.dto.PaymentVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class PaymentServiceImpl implements PaymentService {
	
		@Inject
		PaymentDAO paymentDao;

		// 01. 리스트 보기
		@Override
		public List<PaymentVO> list(HttpSession session) {

			
			return paymentDao.selectAll();

		}
		
		// 02. 사세 정보
		@Override
		public PaymentVO read(int seq) {
			return paymentDao.detailView(seq);
		}
		@Override
		public void delete(int seq) {
			// TODO Auto-generated method stub
			paymentDao.deletePayment(seq);
		}
		@Override
		public void update(PaymentVO vo) {
			// TODO Auto-generated method stub
			paymentDao.updatePayment(vo);
		}
}
