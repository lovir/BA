package com.example.spring02.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring02.model.board.dto.BoardVO;
import com.example.spring02.model.member.dto.MemberVO;
import com.example.spring02.service.member.MemberService;


@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 생성
@RequestMapping("/member/*") // 모든맵핑은 /member/를 상속
public class MemberController {
	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	// 01. 로그인 화면 
	@RequestMapping("login.do")
	public String login(){
		return "member/login";	// views/member/login.jsp로 포워드
	}
	
	// 02. 로그인 처리
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session){
		String result = memberService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if (result.equals("성공")) { // 로그인 성공
			// main.jsp로 이동
			mav.setViewName("home");
			mav.addObject("msg", "success");
		} else if (result.equals("요청")) {
			// login.jsp로 이동
			mav.setViewName("member/login");
			mav.addObject("msg", "request");			
		} else if (result.equals("관리자")) {
			// 관리자 홈으로 이동
			mav.setViewName("admin/adminHome"); // 관리자 페이지 이동
			mav.addObject("msg", "success");			
		} else {	// 로그인 실패
			// login.jsp로 이동
			mav.setViewName("member/login");
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	// 03. 로그아웃 처리
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session){
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		mav.addObject("msg", "logout");
		return mav;
	}
	
	// 04. 호원가입 화면 
	@RequestMapping("joinForm.do")
	public String joinForm(){
		return "member/joinForm";	// views/member/login.jsp로 포워드
	}
	
	// 05. 회원 가입 처리
	@RequestMapping("join.do")
	public ModelAndView join(@ModelAttribute MemberVO vo){
		memberService.join(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	
	// 06. 회원 목록
	@RequestMapping("list.do")
    public ModelAndView list(HttpSession session){
		List<MemberVO> list = memberService.list(session);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
        ModelAndView mav = new ModelAndView();
        mav.addObject("map", map);
        mav.setViewName("member/list");
        return mav;
    }	
	
	// 07. 회원 상세 보기
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
    public ModelAndView detail(@RequestParam String userid, HttpSession session){
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("member/detail");
		// 뷰에 전달할 데이터
		// 댓글의 수 : 댓글이 존재하는 게시물의 삭제처리 방지하기 위해
		mav.addObject("dto", memberService.read(userid));
		logger.info("mav:", mav);
		return mav;
    }
	// 08. 회원 삭제
	@RequestMapping(value="delete.do", method=RequestMethod.GET)
    public String delete(@RequestParam String userId, HttpSession session) throws Exception{
		memberService.delete(userId);
		return "redirect:list.do";
    }
	
	// 09. 회원 정보 수정
	//@RequestMapping(value="update.do", method=RequestMethod.POST)
	@RequestMapping("update.do")
	public String update(@ModelAttribute MemberVO vo) throws Exception{
		memberService.update(vo);
		return "redirect:list.do";
	}
}
