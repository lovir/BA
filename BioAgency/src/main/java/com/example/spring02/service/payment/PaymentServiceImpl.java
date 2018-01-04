package com.example.spring02.service.payment;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.spring02.model.payment.dao.PaymentDAO;
import com.example.spring02.model.payment.dto.PaymentVO;
import com.example.spring02.model.sales.dto.SalesVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class PaymentServiceImpl implements PaymentService {
	
		@Inject
		PaymentDAO paymentDao;

		// 01. 리스트 보기
		@Override
		public List<PaymentVO> list(HttpSession session) {
			
			String userId = session.getAttribute("userId").toString();
			return paymentDao.selectAll(userId);

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

		@Override
//		public int sumRegist(HttpSession session) {
//			// TODO Auto-generated method stub
//			String userId = session.getAttribute("userId").toString();
//			return paymentDao.sumRegist(userId);
//		}
		public List<HashMap> sumRegist(HttpSession session) {
			// TODO Auto-generated method stub
			String userId = session.getAttribute("userId").toString();
			return paymentDao.sumRegist(userId);
		}

		@Override
		public List<HashMap> sumSales(HttpSession session) {
			// TODO Auto-generated method stub
			String userId = session.getAttribute("userId").toString();
			return paymentDao.sumSales(userId);		
		}

		@Override
		public List<HashMap> sumPayment(HttpSession session) {
			// TODO Auto-generated method stub
			String userId = session.getAttribute("userId").toString();
			return paymentDao.sumPayment(userId);		
		}

		@Override
		public List<HashMap> sumEtc(HttpSession session) {
			// TODO Auto-generated method stub
			String userId = session.getAttribute("userId").toString();
			return paymentDao.sumEtc(userId);		
		}

		@Override
		public List<PaymentVO> selectPayment(HttpSession session) {
			// TODO Auto-generated method stub
			String userId = session.getAttribute("userId").toString();
			return paymentDao.selectPayment(userId);
		}

		@Override
		public List<SalesVO> selectSales(HttpSession session, int pid) {
			// TODO Auto-generated method stub
			String userId = session.getAttribute("userId").toString();
			return paymentDao.selectSales(userId, pid) ;
		}

		@Override
		public List<PaymentVO> paymentList(int start, int end, String status) {
			// TODO Auto-generated method stub
			return paymentDao.paymentList(start, end, status) ;
		}

		@Override
		public void completePayment(PaymentVO vo) {
			// TODO Auto-generated method stub
			paymentDao.completePayment(vo);
		}

		@Override
		public void completeSales(PaymentVO vo) {
			// TODO Auto-generated method stub
			paymentDao.completeSales(vo);
		}

		@Override
		public int countPaymentList(String status) {
			// TODO Auto-generated method stub
			return paymentDao.countPaymentList(status) ;
		}
}
