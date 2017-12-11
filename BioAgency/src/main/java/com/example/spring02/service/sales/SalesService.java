package com.example.spring02.service.sales;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.spring02.model.sales.dto.SalesVO;

public interface SalesService {
	public List<SalesVO> list(HttpSession session);
	public void insert(SalesVO vo);
	public Object read(int seq);
	public void delete(int seq);
	public void update(SalesVO vo);
	public void insertEtc(SalesVO vo);
	public void updateEtc(SalesVO vo);

}
