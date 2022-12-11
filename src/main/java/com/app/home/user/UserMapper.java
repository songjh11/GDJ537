package com.app.home.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Mapper
public interface UserMapper {
	
	public int setUser(UserVO userVO)throws Exception;
	
	public int setUserID(UserVO userVO)throws Exception;
	
	public UserVO getUserID()throws Exception;
	
	//프로필 조회
	public UserVO getMypage(UserVO userVO)throws Exception;

	/* 메일주소 변경 */
	public int setChangeEmail(UserVO userVO)throws Exception;
	      
	/* 폰번호 변경 */
	public int setChangePhone(UserVO userVO)throws Exception;
	   
	/* 비밀번호 변경 */
	public int setChangePw(UserVO userVO)throws Exception;
	   
	public int getPwCheck(UserVO userVO)throws Exception;
	   
	public List<RoleVO> getRole() throws Exception;

	public List<DepartmentVO> getDepartment() throws Exception;

	public List<UserVO> getUser() throws Exception;
	
	public List<UserVO> getWait() throws Exception;
	
	public int setAllow(UserVO userVO) throws Exception;
	
	public int setAllowNot(UserVO userVO) throws Exception;
	
	public int setDismiss(UserVO userVO) throws Exception;
	
	public int setRoleNumUpdate(UserVO userVO) throws Exception;
	
	public int setDepNumUpdate(UserVO userVO) throws Exception;
	
	public int setNameUpdate(UserVO userVO) throws Exception;
	
	public int setEmailUpdate(UserVO userVO) throws Exception;
	
	public int setPhoneUpdate(UserVO userVO) throws Exception;
	
	public int setDepartmentInsert(DepartmentVO departmentVO) throws Exception;
	
	public int setDepNameUpdate(DepartmentVO departmentVO) throws Exception;
	
	public int setIdUpdate(DepartmentVO departmentVO) throws Exception;
	
	public int setDepartmentDel(DepartmentVO departmentVO) throws Exception;
	
	public int setRoleAdd(RoleVO roleVO) throws Exception;
	
	public int setRoleNameUpdate(RoleVO roleVO) throws Exception;
	
	public int setRoleDel(RoleVO roleVO) throws Exception;
	
	//사원번호 조회
	public UserVO getIdCheck(UserVO userVO) throws Exception;
	
	//인증된 사원번호 조회
	public int getIdStatus1(UserVO userVO) throws Exception;
	   
	//회원가입
	public int setJoin(UserVO userVO) throws Exception;
	   
	public UserVO getLogin(String username)throws UsernameNotFoundException;
}
