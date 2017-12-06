package com.example.spring02.controller.payment;

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

import com.example.spring02.model.payment.dto.PaymentVO;
import com.example.spring02.service.payment.PaymentService;


@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 생성
@RequestMapping("/payment/*") // 모든맵핑은 /payment/를 상속
public class PaymentController {
	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Inject
	PaymentService paymentService;
	
	// 01. 수당 목록
	@RequestMapping("list.do")
    public ModelAndView list(HttpSession session){
		List<PaymentVO> list = paymentService.list(session);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
        ModelAndView mav = new ModelAndView();
        mav.addObject("map", map);
        mav.setViewName("payment/list");
        return mav;
    }	
	
	// 02. 수당 상세 보기
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
    public ModelAndView detail(@RequestParam int seq, HttpSession session){
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("member/detail");
		// 뷰에 전달할 데이터
		// 댓글의 수 : 댓글이 존재하는 게시물의 삭제처리 방지하기 위해
		mav.addObject("dto", paymentService.read(seq));
		logger.info("mav:", mav);
		return mav;
    }
	// 03. 수당  삭제
	@RequestMapping(value="delete.do", method=RequestMethod.GET)
    public String delete(@RequestParam int seq, HttpSession session) throws Exception{
		paymentService.delete(seq);
		return "redirect:list.do";
    }
	
	// 04. 수당 정보 수정
	//@RequestMapping(value="update.do", method=RequestMethod.POST)
	@RequestMapping("update.do")
	public String update(@ModelAttribute PaymentVO vo) throws Exception{
		paymentService.update(vo);
		return "redirect:list.do";
	}
}
