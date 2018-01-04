package com.example.spring02.model.sales.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring02.model.sales.dao.SalesDAO;
import com.example.spring02.model.sales.dto.SalesVO;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class SalesDAOImpl implements SalesDAO {
	@Inject
	SqlSession sqlSession; // mybatis 실행 객체
	
	public void insertSales(SalesVO vo) {
		sqlSession.insert("sales.insertSales", vo);
	}
	public List<SalesVO> selectAll(int start, int end, String status) {
		// 검색옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("status", status);
		return sqlSession.selectList("sales.selectAll", map); 
	}
	public SalesVO detailView(int seq) {
		return sqlSession.selectOne("sales.detailView", seq);
	}
	public void deleteSales(int seq) {
		sqlSession.delete("sales.deleteSales", seq);
	}
	public void updateSales(SalesVO vo) {
		sqlSession.update("sales.updateSales", vo);
	}
	@Override
	public void insertPayment(SalesVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("sales.insertPayment", vo);
	}
	@Override
	public void updatePayment(SalesVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("sales.updatePayment", vo);
	}
	@Override
	public void insertSalesEtc(SalesVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("sales.insertSalesEtc", vo);
	}
	@Override
	public void insertPaymentEtc(SalesVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("sales.insertPaymentEtc", vo);
	}
	@Override
	public void updateSalesEtc(SalesVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("sales.updateSalesEtc", vo);
	}
	@Override
	public void updatePaymentTec(SalesVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("sales.updatePaymentEtc", vo);
	}
	@Override
	public int countSales(String status) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		return sqlSession.selectOne("sales.countSales", map);
	}
}
