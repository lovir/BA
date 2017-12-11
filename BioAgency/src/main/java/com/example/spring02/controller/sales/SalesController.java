package com.example.spring02.controller.sales;

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

import com.example.spring02.model.member.dto.MemberVO;
import com.example.spring02.model.sales.dto.SalesVO;
import com.example.spring02.service.member.MemberService;
import com.example.spring02.service.sales.SalesService;


@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 생성
@RequestMapping("/sales/*") // 모든맵핑은 /sales/를 상속
public class SalesController {
	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(SalesController.class);
	
	@Inject
	SalesService salesService;
	
	@Inject
	MemberService memberService;
	
	// 01. 수당 목록
	@RequestMapping("list.do")
    public ModelAndView list(HttpSession session){
		List<SalesVO> list = salesService.list(session);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
        ModelAndView mav = new ModelAndView();
        mav.addObject("map", map);
        mav.setViewName("sales/list");
        return mav;
    }	
	
	// 02. 수당 상세 보기
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
    public ModelAndView detail(@RequestParam int seq, HttpSession session){
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("sales/detail");
		// 뷰에 전달할 데이터
		// 댓글의 수 : 댓글이 존재하는 게시물의 삭제처리 방지하기 위해
		mav.addObject("dto", salesService.read(seq));
		logger.info("mav:", mav);
		return mav;
    }
	// 03. 수당  삭제
	@RequestMapping(value="delete.do", method=RequestMethod.GET)
    public String delete(@RequestParam int seq, HttpSession session) throws Exception{
		salesService.delete(seq);
		return "redirect:list.do";
    }
	
	// 05. 수당 정보 수정
	//@RequestMapping(value="update.do", method=RequestMethod.POST)
	@RequestMapping("update.do")
	public String update(@ModelAttribute SalesVO vo) throws Exception{
		if (vo.getPid() == 6)
			salesService.updateEtc(vo);
		else
			salesService.update(vo);
		return "redirect:list.do";
	}
	
	//06. 매출 등록 처리
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute SalesVO vo) throws Exception{
		if (vo.getPid() == 6)
			salesService.insertEtc(vo);
		else
			salesService.insert(vo);
		
		return "redirect:list.do";
	}
	
	// 07. 매출 등록 폼 
	@RequestMapping("insertForm.do")
	public String insertForm(){
		return "sales/insertForm";
	}
	
	// 09. 회원 찾기
	@RequestMapping(value="search.do", method=RequestMethod.GET)
    public ModelAndView search(@RequestParam String name, HttpSession session) {
		List<MemberVO> list = memberService.search(name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
        ModelAndView mav = new ModelAndView();
        mav.addObject("map", map);
        mav.setViewName("sales/search");
        return mav;
    }	
}
