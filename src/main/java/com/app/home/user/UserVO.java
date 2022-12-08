package com.app.home.user;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserVO implements UserDetails {

	private int id;
	private int roleNum;
	private int depNum;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private Date entDate;
	private String profile;
	private String status;

	private String pwCheck;
	private String newPwCheck;
	private String e;
	private String mailOption;

	private RoleVO roleVO;
	private DepartmentVO departmentVO;

	public UserVO() {

	}

	public UserVO(int id, String name, RoleVO roleVO, DepartmentVO departmentVO, Date entDate) {
		this.id = id;
		this.name = name;
		this.roleVO = roleVO;
		this.departmentVO = departmentVO;
		this.entDate = entDate;
	}

	private String pw2;
	private String mail;
	private String address;
	private MultipartFile file;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// <? super T> T나 T의 부모타입을 담을 수 있다. grantedauthority타입이나 이걸 상속받는 타입 을 담을 수 있다.
		List<GrantedAuthority> authorities = new ArrayList<>();

		authorities.add(new SimpleGrantedAuthority(roleVO.getRoleName()));

		return authorities;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.getPw();
	}

	@Override
	public String getUsername() {
		String ids = Integer.toString(this.id);
		return ids;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}
