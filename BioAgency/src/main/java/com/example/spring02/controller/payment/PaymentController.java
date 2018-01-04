package com.example.spring02.controller.payment;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring02.model.board.dto.ReplyVO;
import com.example.spring02.model.payment.dto.PaymentVO;
import com.example.spring02.model.sales.dto.SalesVO;
import com.example.spring02.service.board.BoardPager;
import com.example.spring02.service.board.ReplyPager;
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
//		int sumRegist = paymentService.sumRegist(session);
		List<HashMap> Rlist = paymentService.sumRegist(session);
		List<HashMap> Slist = paymentService.sumSales(session);
		List<HashMap> Plist = paymentService.sumPayment(session);
		List<HashMap> Elist = paymentService.sumEtc(session);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("sumRegist", sumRegist);
		map.put("Rlist", Rlist);
		map.put("Slist", Slist);
		map.put("Plist", Plist);
		map.put("Elist", Elist);
		//map.put("sumTotal", sumRegist + sumSales + sumPayment + sumEtc);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("payment/list"); // 뷰를 list.jsp로 설정
		return mav; // list.jsp로 List가 전달된다.
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
	
	//05. 달력
	@RequestMapping("calendar.do")
	public ModelAndView json_get(HttpSession session) throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();
				
		SimpleDateFormat sf = new SimpleDateFormat("yyyy,MM,dd");
		List<PaymentVO> list = paymentService.list(session);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("/payment/calendar");;
		
		System.out.println(" 리스트 사이즈  : " + list.size());
		
		String str ="[";
		//str +="['지급일' , '금액'] ,";
		int num =0;
		for(PaymentVO  dto : list){
			Calendar cal = Calendar.getInstance();
			cal.setTime(dto.getAmount_date());
			cal.add(Calendar.MONTH, -1);
			
			str +="[new Date(";
			str += sf.format(cal.getTime());
			str +=") , ";
			str += dto.getPayment_amount();
			str +=" ]";
			
			num ++;
			if(num<list.size()){
				str +=",";
			}		
		}
		str += "]";
		modelAndView.addObject("str", str);
		return modelAndView;				
	}
	
	// 06. 수당 목록
	@RequestMapping(value="detailList.do", method=RequestMethod.GET)
    public ModelAndView detailList(@RequestParam int pid, HttpSession session){
		ModelAndView mav = new ModelAndView();
				
		List<SalesVO> Slist = null;
		List<PaymentVO> Plist = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (pid == 4)
		{
			Plist = paymentService.selectPayment(session);
			map.put("list", Plist); // list

		} else			
		{
			Slist = paymentService.selectSales(session, pid);
			map.put("list", Slist); // list
		}
		map.put("pid", pid);
        mav.addObject("map", map);
        mav.setViewName("payment/detailList");
        return mav;
    }
	
	// 07. 수당 지급  목록
	@RequestMapping(value="listPayment.do", method=RequestMethod.GET)
    public ModelAndView listPayment(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="") String status, HttpSession session){
		ModelAndView mav = new ModelAndView();
				
		List<PaymentVO> Plist = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		int count = paymentService.countPaymentList(status);

		// 페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		Plist = paymentService.paymentList(start, end, status);

		map.put("list", Plist); // list
		map.put("boardPager", boardPager);
		map.put("status", status);

        mav.addObject("map", map);
        mav.setViewName("payment/listPayment");
        return mav;
    }
	
	// 08. 수당 지급 처리
	@RequestMapping("paymentComplete.do")
	public String paymentComplete(@ModelAttribute PaymentVO vo) throws Exception{
		
		paymentService.completePayment(vo);
		paymentService.completeSales(vo);
		
		return "redirect:listPayment.do";
	}
}
