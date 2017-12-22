package com.example.spring02.model.member.dao;
 
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.spring02.model.member.dto.MemberVO;

public interface MemberDAO {
	// 01_01. 회원 로그인 체크
	public String loginCheck(MemberVO vo);
	// 01_02. 회원 로그인 정보
	public MemberVO viewMember(MemberVO vo);
	// 02. 회원 로그아웃
	public void logout(HttpSession session);
	public void insertMember(MemberVO vo);
	public MemberVO detailView(String userid);
	public void deleteMember(String userid);
	public void updateMember(MemberVO vo);
	public List<MemberVO> search(String name);
	public List<MemberVO> subMemberList(String userid);
	public List<MemberVO> orgList();
	public int countMember(String status);
	public List<MemberVO> selectAll(int start, int end, String status);
}