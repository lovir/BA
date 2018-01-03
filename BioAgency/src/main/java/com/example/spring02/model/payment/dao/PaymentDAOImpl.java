package com.example.spring02.model.payment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring02.model.payment.dao.PaymentDAO;
import com.example.spring02.model.payment.dto.PaymentVO;
import com.example.spring02.model.sales.dto.SalesVO;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class PaymentDAOImpl implements PaymentDAO {
	@Inject
	SqlSession sqlSession; // mybatis 실행 객체
	
	public void insertPayment(PaymentVO vo) {
		sqlSession.insert("payment.insertPayment", vo);
	}
	public List<PaymentVO> selectAll(String user_id) {
		return sqlSession.selectList("payment.selectAll", user_id); 
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
	@Override
	public int sumRegist(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("payment.sumRegist", user_id);
	}
	@Override
	public int sumSales(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("payment.sumSales", user_id);
	}
	@Override
	public int sumPayment(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("payment.sumPayment", user_id);
	}
	@Override
	public int sumEtc(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("payment.sumEtc", user_id);
	}
	@Override
	public List<PaymentVO> selectPayment(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("payment.selectPayment", user_id);
	}
	@Override
	public List<SalesVO> selectSales(String user_id, int pid) {
		// TODO Auto-generated method stub
		if (pid == 1){
			return sqlSession.selectList("payment.selectSales1", user_id);
		}else if (pid == 2) {
			return sqlSession.selectList("payment.selectSales2", user_id);
		}else {
			return sqlSession.selectList("payment.selectSales3", user_id);
		}
	}
	@Override
	public List<PaymentVO> paymentList(String strStatus) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strStatus", strStatus);
		System.out.println(" ## sqlSession.selectMap(\"payment.paymentList2\", strStatus) " + sqlSession.selectList("payment.paymentList2", map));
		//return sqlSession.selectList("payment.paymentList2", map);
		return sqlSession.selectList("sales.paymentList", map);
	}
	
	@Override
	public void completePayment(PaymentVO vo) { 
		// TODO Auto-generated method stub
		sqlSession.update("payment.completePayment", vo);
	}
	
	@Override
	public void completeSales(PaymentVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("payment.completeSales", vo);
	}
	@Override
	public List<PaymentVO> paymentList2(String strStatus) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strStatus", strStatus);
		return sqlSession.selectList("payment.paymentList2", map);
	}
}
