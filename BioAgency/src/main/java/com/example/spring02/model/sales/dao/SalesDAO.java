package com.example.spring02.model.sales.dao;

import java.util.List;

import com.example.spring02.model.sales.dto.SalesVO;

public interface SalesDAO {

	public void insertSales(SalesVO vo);
	public List<SalesVO> selectAll();
	public SalesVO detailView(int seq);
	public void deleteSales(int seq);
	public void updateSales(SalesVO vo);
}
