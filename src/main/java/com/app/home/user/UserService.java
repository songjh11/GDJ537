package com.app.home.user;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.app.home.report.ReportMapper;
import com.app.home.user.util.FileUserManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ReportMapper reportMapper;

	@Autowired
	private FileUserManager fileManager;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Value("${app.file.base}") // C:/user/profile/
	private String path;

	public UserVO setUserID(UserVO userVO) throws Exception {
		userMapper.setUser(userVO);
		userMapper.setUserID(userVO);
		return userMapper.getUserID();
	}

	// 프로필 조회
	public UserVO getMypage(UserVO userVO) throws Exception {
		return userMapper.getMypage(userVO);
	}
	
	public UserVO setProfileSet(UserVO userVO)throws Exception{
		
		File file = new File(path+"user/");
		if(!file.exists()) {
			file.mkdirs();
		}
		
		if (userVO.getFile() != null) {
			MultipartFile f = userVO.getFile();
			String fileName = fileManager.saveFile(f, path+"user/");
			userVO.setProfile(fileName);
			userVO.setId(userVO.getId());
			userMapper.setProfileSet(userVO);

		}
		
		return userVO;
	   }
   
   public int setProfileUpdate(UserVO userVO)throws Exception{
      return userMapper.setProfileUpdate(userVO);
   }

	/* 비밀번호 변경 */
	public int setChangePw(UserVO userVO, UserVO sessionVO) throws Exception {
	    userVO.setPw(passwordEncoder.encode(userVO.getPw()));
		int result = userMapper.setChangePw(userVO);
	      if(result == 1) {
	         sessionVO.setPw(userVO.getPw());
	      }
		return result;
	}
	
	public int setChangePw(UserVO userVO) throws Exception {
		int result = userMapper.setChangePw(userVO);
		return result;
	}
	
	// 비밀번호 일치 확인(본인확인)
	public int getPwCheck(UserVO userVO, UserVO sessionUserVO) throws Exception {
		// mathces("평문 비번", "인코딩된 pw")

	      if(passwordEncoder.matches(userVO.getPw(), sessionUserVO.getPw())) {
	    	  userVO.setPw(sessionUserVO.getPw());
	      }else {
	      }   

		return userMapper.getPwCheck(userVO);
	}

	/* 메일주소 변경 */
	public int setChangeEmail(UserVO userVO, String e, String mailOption) throws Exception {
		userVO.setEmail(e + "@" + mailOption);
		return userMapper.setChangeEmail(userVO);
	}

	/* 폰번호 변경 */
	public int setChangePhone(UserVO userVO) throws Exception {
		return userMapper.setChangePhone(userVO);
	}

	public List<RoleVO> getRole() throws Exception {
		List<RoleVO> list = userMapper.getRole();
		return list;
	}

	public List<DepartmentVO> getDepartment() throws Exception {
		List<DepartmentVO> list = userMapper.getDepartment();
		return list;
	}

	public List<UserVO> getUser() throws Exception {
		List<UserVO> list = userMapper.getUser();
		return list;
	}

	public List<UserVO> getWait() throws Exception {
		List<UserVO> list = userMapper.getWait();
		return list;
	}

	public int setAllow(UserVO userVO) throws Exception {
		int result = userMapper.setAllow(userVO);
		return result;
	}

	public int setAllowNot(UserVO userVO) throws Exception {
		int result = userMapper.setAllowNot(userVO);
		return result;
	}

	public int setDismiss(UserVO userVO) throws Exception {
		int result = userMapper.setDismiss(userVO);
		return result;
	}

	public int setRolenumUpdate(UserVO userVO) throws Exception {
		int result = userMapper.setRolenumUpdate(userVO);
		return result;
	}

	public int setDepnumUpdate(UserVO userVO) throws Exception {
		int result = userMapper.setDepnumUpdate(userVO);
		return result;
	}

	public int setNameUpdate(UserVO userVO) throws Exception {
		int result = userMapper.setNameUpdate(userVO);
		return result;
	}

	public int setEmailUpdate(UserVO userVO) throws Exception {
		int result = userMapper.setEmailUpdate(userVO);
		return result;
	}

	public int setPhoneUpdate(UserVO userVO) throws Exception {
		int result = userMapper.setPhoneUpdate(userVO);
		return result;
	}
	
	public int setEntDateUpdate(UserVO userVO) throws Exception {
		int result = userMapper.setEntDateUpdate(userVO);
		return result;
	}

	public int setDepartmentInsert(DepartmentVO departmentVO) throws Exception {
		int result = userMapper.setDepartmentInsert(departmentVO);
		return result;
	}

	public int setDepNameUpdate(DepartmentVO departmentVO) throws Exception {
		int result = userMapper.setDepNameUpdate(departmentVO);
		return result;
	}

	public int setIdUpdate(DepartmentVO departmentVO) throws Exception {
		int result = userMapper.setIdUpdate(departmentVO);
		return result;
	}

	public int setDepartmentDel(DepartmentVO departmentVO) throws Exception {
		int result = userMapper.setDepartmentDel(departmentVO);
		return result;
	}

	public int setRoleDel(RoleVO roleVO) throws Exception {
		int result = userMapper.setRoleDel(roleVO);
		return result;
	}

	public int setRoleNameUpdate(RoleVO roleVO) throws Exception {
		int result = userMapper.setRoleNameUpdate(roleVO);
		return result;
	}

	public int setRoleAdd(RoleVO roleVO) throws Exception {
		int result = userMapper.setRoleAdd(roleVO);
		return result;
	}
	
	public List<UserVO> getDepCheck(UserVO userVO) throws Exception {
		List<UserVO> userVOs = userMapper.getDepCheck(userVO);
		return userVOs;
	}
	
	public List<UserVO> getRoleCheck(UserVO userVO) throws Exception {
		List<UserVO> userVOs = userMapper.getRoleCheck(userVO);
		return userVOs;
	}


	// 사원번호 조회
	public UserVO getIdCheck(UserVO userVO) throws Exception {
		return userMapper.getIdCheck(userVO);
	}
		
	// 회원가입
	public int setJoin(UserVO userVO, String e, String address) throws Exception {
		
//		//회원가입 하기전에 승인자 테이블로 먼저 insert (보고서조)
//		int result = reportMapper.setLicenserAdd(userVO);
//		
		// 패스워드 암호화
		userVO.setPw(passwordEncoder.encode(userVO.getPw()));

		// 이메일
		userVO.setEmail(e + "@" + address);

		// 프로필사진 등록
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}

		if (userVO.getFile() != null) {
			MultipartFile f = userVO.getFile();
			String fileName = fileManager.saveFile(f, path);
			userVO.setProfile(fileName);
			log.info("=====회원가입 : {}", userVO);
			return userMapper.setJoin(userVO);
		}
		
		return userMapper.setJoin(userVO);
	}

	//사용자 검증 메서드(인증된 사원번호 체크, 이메일 입력 체크, 비번 일치 검증, 휴대번호 입력 검증)
	public boolean getUserError(UserVO userVO, BindingResult bindingResult) throws Exception {
		// check=false : 검증 성공(에러없음)
		// check=true : 검증 실패(에러있음)
		boolean check = false;

		// annotation검증
		check = bindingResult.hasErrors();

		// 비번 일치 검증
		if (!userVO.getPw().equals(userVO.getPw2())) {
			check = true;
			bindingResult.rejectValue("pw2", "user.password.notEqual");
		}

		// 이메일 입력 검증
		if (userVO.getAddress().equals("선택")) {
			check = true;
			bindingResult.rejectValue("address", "user.email.req");
		}

		return check;
	}
}
