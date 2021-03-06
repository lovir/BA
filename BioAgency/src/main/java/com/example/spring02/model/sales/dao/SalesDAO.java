package com.example.spring02.model.sales.dao;

import java.util.List;

import com.example.spring02.model.sales.dto.SalesVO;

public interface SalesDAO {

	public void insertSales(SalesVO vo);
	public List<SalesVO> selectAll(int start, int end, String status);
	public SalesVO detailView(int seq);
	public void deleteSales(int seq);
	public void updateSales(SalesVO vo);
	public void insertPayment(SalesVO vo);
	public void updatePayment(SalesVO vo);
	public void insertSalesEtc(SalesVO vo);
	public void insertPaymentEtc(SalesVO vo);
	public void updateSalesEtc(SalesVO vo);
	public void updatePaymentTec(SalesVO vo);
	public int countSales(String status);
}
