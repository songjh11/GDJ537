package com.app.home.user;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user/*")
@Slf4j
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("usernum")
	public String getNum() throws Exception {
		return "user/usernum";
	}

	@RequestMapping("setID")
	@ResponseBody
	public UserVO setID(@RequestBody UserVO userVO) throws Exception {
		log.info("userdate => {}", userVO.getEntDate());
		userVO = userService.setUserID(userVO);
		return userVO;
	}

	@GetMapping("mypage")
	public ModelAndView getMypage(UserVO userVO, ModelAndView mv) throws Exception {
		userVO.setId(1234);
		userVO = userService.getMypage(userVO);
		mv.addObject("userVO", userVO);
		mv.setViewName("/user/mypage");
		return mv;
	}

	@GetMapping("setting")
	public ModelAndView getSet_up(UserVO userVO, ModelAndView mv) throws Exception {
		userVO.setId(1234);
		userVO = userService.getMypage(userVO);
		mv.addObject("userVO", userVO);
		mv.setViewName("/user/setting");
		return mv;

	}

	/* 내 설정 - 비밀번호 변경 */
	@PostMapping("changePw")
	@ResponseBody
	public int setChangePw(UserVO userVO, HttpSession session) throws Exception {
//	      SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
//	      Authentication authentication = context.getAuthentication();
//	      MemberVO sessionMemberVO = (MemberVO) authentication.getPrincipal();

		userVO.setId(1234);

		int result = userService.setChangePw(userVO);

		return result;
	}

	@PostMapping("pwCheck")
	@ResponseBody
	public int getPwCheck(HttpSession session, UserVO userVO) throws Exception {

		userVO.setId(1234);
		return userService.getPwCheck(userVO);
	}

	/* 내 설정 - 이메일 변경 */
	@PostMapping("changeEmail")
	@ResponseBody
	public int setChangeEmail(UserVO userVO, HttpSession session, String e, String mailOption) throws Exception {

		userVO.setId(1234);
		userVO.setEmail(userVO.getEmail());

		int result = userService.setChangeEmail(userVO, e, mailOption);

		return result;
	}

	/* 내 설정 - 전화번호 변경 */
	@PostMapping("changePhone")
	@ResponseBody
	public int setChangePhone(UserVO userVO, HttpSession session) throws Exception {

		userVO.setId(1234);
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
		mv.addObject("list", list);
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

	@GetMapping("join")
	public void setJoin(@ModelAttribute UserVO userVO) throws Exception {

	}

	// 회원가입
	@PostMapping("join")
	public ModelAndView setJoin(@Valid UserVO userVO, BindingResult bindingResult, String email, String address,
			MultipartFile file) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = userService.setJoin(userVO, email, address);

		mv.setViewName("redirect:/");
		return mv;
	}

	// 사원번호조회
	@PostMapping("idCheck")
	@ResponseBody
	public UserVO getIdCheck(UserVO userVO) throws Exception {
		userVO = userService.getIdCheck(userVO);
		UserVO info = new UserVO(userVO.getId(), userVO.getName(), userVO.getRoleVO(), userVO.getDepartmentVO(),
				userVO.getEntDate());
		log.info("사원번호조회 : {}", info);
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
