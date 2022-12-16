package com.app.home.user;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.schedule.car.CarService;
import com.app.home.schedule.goods.ReserveVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user/*")
@Slf4j
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CarService carService;

	@GetMapping("usernum")
	public String getNum() throws Exception {
		return "user/usernum";
	}

	@RequestMapping("setID")
	@ResponseBody
	public HashMap<String, String> setID(@RequestBody UserVO userVO) throws Exception {
		HashMap<String, String> map = new HashMap<>();
		userVO = userService.setUserID(userVO);
		map.put("id", Integer.toString(userVO.getId()));
		map.put("name", userVO.getName());
		return map;
	}

	@GetMapping("mypage")
	public ModelAndView getMypage(HttpSession session, UserVO userVO, ModelAndView mv) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  =(UserVO)authentication.getPrincipal();
	    
	    // 개인 예약내역 추가
	    List<ReserveVO> reserveVOs = carService.getReserveUserList(userVO);
	    System.out.println("r"+ reserveVOs);
	    
		userVO = userService.getMypage(userVO);
		mv.addObject("reserveVO", reserveVOs);
		mv.addObject("userVO", userVO);
		mv.setViewName("/user/mypage");
		return mv;
	}

	@GetMapping("setting")
	public ModelAndView getSet_up(HttpSession session, UserVO userVO, ModelAndView mv) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  =(UserVO)authentication.getPrincipal();
		userVO = userService.getMypage(userVO);
		mv.addObject("userVO", userVO);
		mv.setViewName("/user/setting");
		return mv;

	}
	
	@PostMapping("setting")
	public ModelAndView setProfileSet(HttpSession session, UserVO userVO, MultipartFile file, ModelAndView mv)throws Exception {
      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
      Authentication authentication = context.getAuthentication();
      userVO  =(UserVO)authentication.getPrincipal();
      userVO.setFile(file);
      userVO = userService.setProfileSet(userVO);
      
      mv.setViewName("redirect:/user/setting");
      mv.addObject("userVO", userVO);

      return mv;
   }
	
	// 프로필사진 삭제 - profile null로 update
   @PostMapping("profile_delete")
   @ResponseBody
   public int setProfileDelete(HttpSession session, UserVO userVO, ModelAndView mv)throws Exception {
	   SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    userVO  =(UserVO)authentication.getPrincipal();
      
      int result = userService.setProfileUpdate(userVO);

      return result;
   }

	/* 내 설정 - 비밀번호 변경 */
	@PostMapping("changePw")
	@ResponseBody
	public int setChangePw(UserVO userVO, HttpSession session) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    UserVO sessionUserVO  =(UserVO)authentication.getPrincipal();

	    userVO.setId(sessionUserVO.getId());
		int result = userService.setChangePw(userVO, sessionUserVO);

		return result;
	}

	@PostMapping("pwCheck")
	@ResponseBody
	public int getPwCheck(HttpSession session, UserVO userVO) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    UserVO sessionUserVO  =(UserVO)authentication.getPrincipal();
	    userVO.setId(sessionUserVO.getId());
		return userService.getPwCheck(userVO, sessionUserVO);
	}

	/* 내 설정 - 이메일 변경 */
	@PostMapping("changeEmail")
	@ResponseBody
	public int setChangeEmail(UserVO userVO, HttpSession session, String e, String mailOption) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    UserVO sessionUserVO  =(UserVO)authentication.getPrincipal();
	    
		userVO.setId(sessionUserVO.getId());

		int result = userService.setChangeEmail(userVO, e, mailOption);

		return result;
	}

	/* 내 설정 - 전화번호 변경 */
	@PostMapping("changePhone")
	@ResponseBody
	public int setChangePhone(UserVO userVO, HttpSession session) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
	    Authentication authentication = context.getAuthentication();
	    UserVO sessionUserVO  =(UserVO)authentication.getPrincipal();
	    userVO.setId(sessionUserVO.getId());
		int result = userService.setChangePhone(userVO);

		return result;
	}

	@GetMapping("admin/wait")
	public ModelAndView getWait() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<UserVO> list = userService.getWait();
		mv.addObject("list", list);
		mv.setViewName("/user/admin/wait");
		return mv;
	}

	@GetMapping("admin/user")
	public ModelAndView getUser() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<UserVO> list = userService.getUser();
		List<DepartmentVO> listD = userService.getDepartment();
		List<RoleVO> listR = userService.getRole();
		mv.addObject("list", list);
		mv.addObject("listD", listD);
		mv.addObject("listR", listR);
		mv.setViewName("/user/admin/user");
		return mv;
	}

	@GetMapping("admin/department")
	public ModelAndView getDepartment() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<DepartmentVO> list = userService.getDepartment();
		mv.addObject("list", list);
		mv.setViewName("/user/admin/department");
		return mv;
	}

	@GetMapping("admin/role")
	public ModelAndView getRole() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<RoleVO> list = userService.getRole();
		mv.addObject("list", list);
		mv.setViewName("/user/admin/role");
		return mv;
	}

	@PostMapping("admin/allow")
	@ResponseBody
	public int setAllow(UserVO userVO) throws Exception {
		log.info("=================={}", userVO.getId());
		int result = userService.setAllow(userVO);
		return result;
	}

	@PostMapping("admin/allowNot")
	@ResponseBody
	public int setAllowNot(UserVO userVO) throws Exception {
		int result = userService.setAllow(userVO);
		return result;
	}

	@PostMapping("admin/dismiss")
	@ResponseBody
	public int setDismiss(UserVO userVO) throws Exception {
		int result = userService.setDismiss(userVO);
		return result;
	}

	@PostMapping("admin/roleNumUpdate")
	@ResponseBody
	public int setRoleNumUpdate(UserVO userVO) throws Exception {
		int result = userService.setRoleNumUpdate(userVO);
		return result;
	}

	@PostMapping("admin/depNumUpdate")
	@ResponseBody
	public int setDepNumUpdate(UserVO userVO) throws Exception {
		int result = userService.setDepNumUpdate(userVO);
		return result;
	}

	@PostMapping("admin/nameUpdate")
	@ResponseBody
	public int setNameUpdate(UserVO userVO) throws Exception {
		int result = userService.setNameUpdate(userVO);
		return result;
	}

	@PostMapping("admin/emailUpdate")
	@ResponseBody
	public int setEmailUpdate(UserVO userVO) throws Exception {
		int result = userService.setEmailUpdate(userVO);
		return result;
	}

	@PostMapping("admin/phoneUpdate")
	@ResponseBody
	public int setPhoneUpdate(UserVO userVO) throws Exception {
		int result = userService.setPhoneUpdate(userVO);
		return result;
	}
	
	@PostMapping("admin/entDateUpdate")
	@ResponseBody
	public int setEntDateUpdate(UserVO userVO) throws Exception {
		int result = userService.setEntDateUpdate(userVO);
		return result;
	}

	@PostMapping("admin/departmentInsert")
	@ResponseBody
	public int setDepartmentInsert(DepartmentVO departmentVO) throws Exception {
		int result = userService.setDepartmentInsert(departmentVO);
		return result;
	}

	@PostMapping("admin/depNameUpdate")
	@ResponseBody
	public int setDepNameUpdate(DepartmentVO departmentVO) throws Exception {
		int result = userService.setDepNameUpdate(departmentVO);
		return result;
	}

	@PostMapping("admin/idUpdate")
	@ResponseBody
	public int setIdUpdate(DepartmentVO departmentVO) throws Exception {
		int result = userService.setIdUpdate(departmentVO);
		return result;
	}

	@PostMapping("admin/departmentDel")
	@ResponseBody
	public int setDepartmentDel(DepartmentVO departmentVO) throws Exception {
		int result = userService.setDepartmentDel(departmentVO);
		return result;
	}

	@PostMapping("admin/roleAdd")
	@ResponseBody
	public int setRoleAdd(RoleVO roleVO) throws Exception {

		log.info(roleVO.getRoleName());
		int result = userService.setRoleAdd(roleVO);
		return result;
	}

	@PostMapping("admin/roleNameUpdate")
	@ResponseBody
	public int setRoleNameUpdate(RoleVO roleVO) throws Exception {
		int result = userService.setRoleNameUpdate(roleVO);
		return result;
	}

	@PostMapping("admin/roleDel")
	@ResponseBody
	public int setRoleDel(RoleVO roleVO) throws Exception {
		int result = userService.setRoleDel(roleVO);
		return result;
	}
	
	@PostMapping("admin/depCheck")
	@ResponseBody
	public int getDepCheck(UserVO userVO) throws Exception {
		List<UserVO> userVOs = userService.getDepCheck(userVO);
		int result = userVOs.size();
		return result;
	}
	
	@PostMapping("admin/roleCheck")
	@ResponseBody
	public int getroleCheck(UserVO userVO) throws Exception {
		List<UserVO> userVOs = userService.getRoleCheck(userVO);
		int result = userVOs.size();
		return result;
	}

	@GetMapping("join")
	public void setJoin(@ModelAttribute UserVO userVO) throws Exception {

	}

	// 회원가입
	@PostMapping("join")
	public ModelAndView setJoin(@Valid UserVO userVO, BindingResult bindingResult, String e, String address, MultipartFile file) throws Exception {
		ModelAndView mv = new ModelAndView();

		//사용자 검증 메서드
		boolean check = userService.getUserError(userVO, bindingResult);
		
		// check=false : 검증 성공(에러없음)
		// check=true : 검증 실패(에러있음)
		if(check) {
			mv.setViewName("user/join");
			List<FieldError> errors = bindingResult.getFieldErrors();
			for(FieldError fieldError:errors) {
				mv.addObject(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return mv;
		}
		int result = userService.setJoin(userVO, e, address);
		if(result == 1) {
			mv.setViewName("redirect:./login");
		} 
		return mv;
	}
	
	
	// 사원번호조회
	@PostMapping("idCheck")
	@ResponseBody
	public UserVO getIdCheck(UserVO userVO) throws Exception {
		userVO = userService.getIdCheck(userVO);
		log.info("사원번호조회 : {}", userVO);
		return userVO;
	}

	@GetMapping("login")
	public void getLogin(@RequestParam(defaultValue = "false", required = false) boolean error, String message,
			Model model) throws Exception {
		if (error) {
			model.addAttribute("msg", "ID 또는 PW를 확인하세요");
		}
	}

	@PostMapping("login")
	public String getLogin() throws Exception {
		log.info(" ========= Login Post ===========");
		return "user/login";
	}

}
