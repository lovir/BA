package com.example.spring02.service.member;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.spring02.model.member.dao.MemberDAO;
import com.example.spring02.model.member.dto.MemberVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO memberDao;
	
	// 01_01. 회원 로그인체크
	@Override
	public String loginCheck(MemberVO vo, HttpSession session) {
		String result = memberDao.loginCheck(vo);
		if (result.equals("성공") || result.equals("관리자")) { // true일 경우 세션에 등록
			MemberVO vo2 = viewMember(vo);
			// 세션 변수 등록
			session.setAttribute("userId", vo2.getUserId());
			session.setAttribute("userName", vo2.getUserName());
		} 
		return result;
	}
	// 01_02. 회원 로그인 정보
	@Override
	public MemberVO viewMember(MemberVO vo) {
		return memberDao.viewMember(vo);
	}
	// 02. 회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		// 세션 변수 개별 삭제
		// session.removeAttribute("userId");
		// 세션 정보를 초기화 시킴
		session.invalidate();
	}
	
	// 03. 회원 가입 처리
	@Override
	public void join(MemberVO vo) {
	 //if(vo.getUserPw().equals(params.get("pwd_CHECK")))
     //   {
		memberDao.insertMember(vo);
      //  }
	//	return result;
	}
	
	// 04. 회원 리스트 보기
	@Override
	public List<MemberVO> list(HttpSession session) {
	 //if(vo.getUserPw().equals(params.get("pwd_CHECK")))
     //   {
		return memberDao.selectAll();
      //  }
	//	return result;
	}
	
	// 05. 회원 상세 정보
	@Override
	public MemberVO read(String userid) {
		return memberDao.detailView(userid);
	}
	@Override
	public void delete(String userid) {
		// TODO Auto-generated method stub
		memberDao.deleteMember(userid);
	}
	@Override
	public void update(MemberVO vo) {
		// TODO Auto-generated method stub
		memberDao.updateMember(vo);
	}
	
}
