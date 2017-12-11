package com.example.spring02.service.sales;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.spring02.model.sales.dao.SalesDAO;
import com.example.spring02.model.sales.dto.SalesVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class SalesServiceImpl implements SalesService {
	
		@Inject
		SalesDAO salesDao;

		// 01. 리스트 보기
		@Override
		public List<SalesVO> list(HttpSession session) {

			
			return salesDao.selectAll();

		}
		
		// 02. 사세 정보
		@Override
		public SalesVO read(int seq) {
			return salesDao.detailView(seq);
		}
		@Override
		public void delete(int seq) {
			// TODO Auto-generated method stub
			salesDao.deleteSales(seq);
		}
		@Override
		public void update(SalesVO vo) {
			// TODO Auto-generated method stub
			salesDao.updateSales(vo);
			salesDao.updatePayment(vo);
		}

		@Override
		public void insert(SalesVO vo) {
			// TODO Auto-generated method stub
			salesDao.insertSales(vo);
			salesDao.insertPayment(vo);
		}

		@Override
		public void insertEtc(SalesVO vo) {
			// TODO Auto-generated method stub
			salesDao.insertSalesEtc(vo);
			salesDao.insertPaymentEtc(vo);
		}

		@Override
		public void updateEtc(SalesVO vo) {
			// TODO Auto-generated method stub
			salesDao.updateSalesEtc(vo);
			salesDao.updatePaymentTec(vo);
		}
}
