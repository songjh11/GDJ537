package com.app.home.schedule.goods;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping(value="/goods/*")
@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("add")
	public String getAdd() throws Exception{
		return "/goods/add";
	}
	
	@PostMapping("add")
	public String setAdd(GoodsVO goodsVO, MultipartFile [] files,
			RedirectAttributes redirectAttributes,HttpSession session) throws Exception{
		int result = goodsService.setAdd(goodsVO,files,session.getServletContext());
		return "redirect:/goods/add";
	}
	
	@GetMapping("update")
	public ModelAndView getUpdate(GoodsVO goodsVO,ModelAndView mv,HttpSession session) throws Exception{
		goodsVO = goodsService.getGoods(goodsVO);
		String str = goodsVO.getId().substring(0,2);
		session.setAttribute("id", goodsVO.getId());
		if(goodsVO.getGoodsFileVO() != null) {
			List<GoodsFileVO> list = goodsVO.getGoodsFileVO();
			mv.addObject("list", list);
		}
		mv.addObject("str", str);
		mv.addObject("goods", goodsVO);
		mv.setViewName("/goods/update");
		return mv;
	}
	
	@PostMapping("update")
	public String setUpdate(GoodsVO goodsVO,MultipartFile [] files,HttpSession session,String [] fileUpdateNumber) throws Exception {
		String id = (String) session.getAttribute("id");
		goodsVO.setId(id);
		int result = goodsService.setUpdate(goodsVO,files,session.getServletContext(),fileUpdateNumber);
		return "/goods/update";
	}
	
	@PostMapping("fileUpdateNumber")
	@ResponseBody
	public int setFileUpdateNumber(GoodsFileVO goodsFileVO) throws Exception{
		long ROWNUM = goodsFileVO.getRowNum()+1L;
		goodsFileVO.setRowNum(ROWNUM);
		goodsFileVO = goodsService.getFileNumCheck(goodsFileVO);
		int result = goodsFileVO.getImgNum().intValue();
		
		return result;
	}
	
	@PostMapping("fileDelete")
	@ResponseBody
	public int setAttachFileDelete(GoodsFileVO goodsFileVO)throws Exception{
		long ROWNUM = goodsFileVO.getRowNum()+1L;
		goodsFileVO.setRowNum(ROWNUM);
		goodsFileVO = goodsService.getFileNumCheck(goodsFileVO);
		int result = goodsService.setFileNumCheckDelete(goodsFileVO);
		
		return result;
	}
	
	@GetMapping("delete")
	@ResponseBody
	public ModelAndView setGoodsDelete(GoodsVO goodsVO,ModelAndView mv) throws Exception{
		int result = goodsService.setGoodsDelete(goodsVO);
		//리스트 페이지로
		mv.setViewName("/goods/ad_list");
		return mv;
	}
	
	@GetMapping("ad_list")
	public ModelAndView getAdminGoodsList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<GoodsVO> room = goodsService.getRoomList();
		List<GoodsVO> car = goodsService.getCarList();
		
		mv.addObject("room", room);
		mv.addObject("car", car);
		mv.setViewName("/goods/ad_list");
		return mv;
	}
	
	

}
