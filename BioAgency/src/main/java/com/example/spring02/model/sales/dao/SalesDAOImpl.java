package com.example.spring02.model.sales.dao;

import java.util.List;

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
	public List<SalesVO> selectAll() {
		return sqlSession.selectList("sales.selectAll"); 
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
}
