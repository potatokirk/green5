package com.lgy.shallweshare.users.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UsersDto {

	private int u_id;
	private int u_pwd;
	private String u_role;
	private String u_login_platform;
	private String u_sns_id;
	private String u_name;
	private String u_nickname;
	private Timestamp u_birth;
	private String u_phonenum;
	private String u_gender;
	private String u_email;
	private String u_bank_account;
	private String u_authentication;
	private int u_temperature;
	private Timestamp u_created;

}
