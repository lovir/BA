package com.example.spring02.model.member.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring02.model.board.dto.BoardVO;
import com.example.spring02.model.member.dto.MemberVO;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class MemberDAOImpl implements MemberDAO {
	// SqlSession 객체를 스프핑에서 생성하여 주입
	// 의존관계 주입(Dependency Injection), 느슨한 결합
	@Inject
	SqlSession sqlSession; // mybatis 실행 객체
	
	// 01_01. 회원 로그인체크
	@Override
	public String loginCheck(MemberVO vo) {
		String status = sqlSession.selectOne("member.loginCheck", vo);
		return (status == null) ? "실패" : (status.equals("요청")) ? "요청" : (status.equals("관리자")) ? "관리자" : "성공";
	}
	// 01_02. 회원 로그인 정보
	@Override
	public MemberVO viewMember(MemberVO vo) {
		return sqlSession.selectOne("member.viewMember", vo);
	}
	// 02. 회원 로그아웃
	@Override
	public void logout(HttpSession sessin) {
	}
	
	// 03. 회원 가입 처리
	@Override
	public void insertMember(MemberVO vo){
		sqlSession.insert("member.insertMember", vo);
	}
	
	// 04. 회원 관리
	@Override
	public List<MemberVO> selectAll(){
		return sqlSession.selectList("member.selectAll"); 
	}
	@Override
	public MemberVO detailView(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.detailView", userid);
	}
	@Override
	public void deleteMember(String userid) {
		// TODO Auto-generated method stub
		sqlSession.delete("member.deleteMember", userid);
	}
	@Override
	public void updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("member.updateMember", vo);
	}
}
