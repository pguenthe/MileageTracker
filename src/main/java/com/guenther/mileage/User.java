package com.guenther.mileage;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity(name="User")
@Table(name="user")
public class User {
	@Id @GeneratedValue
	@Column(name="uid")
	private int id;

	@NotNull(message="User email cannot be blank")
	@Size(min=6,max=100)
	@Column(name="email")
	private String email;
	
	@NotNull(message="Password cannot be blank")
	@Column(name="password")
	private String password;
	
	@Column(name="firstname")
	private String firstname;
	
	public User(int id, String email, String password, String firstname) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.firstname = firstname;
	}

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
