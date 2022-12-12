package com.app.home.report;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserVO{

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
   private List<DepartmentVO> departmentVOs;
   private ReportVO reportVO;
   private List<ReportVO> reportVOs;

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

}