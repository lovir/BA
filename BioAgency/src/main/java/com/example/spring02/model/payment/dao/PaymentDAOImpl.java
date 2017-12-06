package com.example.spring02.model.payment.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring02.model.payment.dao.PaymentDAO;
import com.example.spring02.model.payment.dto.PaymentVO;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class PaymentDAOImpl implements PaymentDAO {
	@Inject
	SqlSession sqlSession; // mybatis 실행 객체
	
	public void insertPayment(PaymentVO vo) {
		sqlSession.insert("payment.insertPayment", vo);
	}
	public List<PaymentVO> selectAll() {
		return sqlSession.selectList("payment.selectAll"); 
	}
	public PaymentVO detailView(int seq) {
		return sqlSession.selectOne("payment.detailView", seq);
	}
	public void deletePayment(int seq) {
		sqlSession.delete("payment.deletePayment", seq);
	}
	public void updatePayment(PaymentVO vo) {
		sqlSession.update("payment.updatePayment", vo);

	}
}
