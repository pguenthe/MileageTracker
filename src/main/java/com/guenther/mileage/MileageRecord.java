package com.guenther.mileage;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name="MileageRecord")
@Table(name="mileage")
public class MileageRecord {
	@Id @GeneratedValue
	@Column(name="id")
	private int id;

	@NotNull(message="User ID cannot be blank")
	@Column(name="userid")
	private int userid;
	
	@NotNull
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@Column(name="date")
	private Date date;
	
	@NotNull(message="Mileage cannot be blank")
    @Min(0)
	@Column(name="mileage")
	private double mileage;
	
	@Column(name="price")
	private double price;
	
	@NotNull
	@Min(0)
	@Column(name="gallons")
	private double gallons;
	
	@Column(name="total")
	private double total;
	
	//field is calculated, not in DB
	@Transient
	private double mpg;
	
	public MileageRecord() {
		super();
	}

	public MileageRecord(int id, int userid, Date date, int mileage, double price, double gallons, double total) {
		super();
		this.id = id;
		this.userid = userid;
		this.date = date;
		this.mileage = mileage;
		this.price = price;
		this.gallons = gallons;
		this.total = total;
	}

	public int getId() {
		return id;
	}

	public int getUserid() {
		return userid;
	}

	public Date getDate() {
		return date;
	}
	
	public String getDateString() {
		SimpleDateFormat ft = 
			new SimpleDateFormat ("MM/dd/yyyy");
		return ft.format(date);
	}

	public double getMileage() {
		return mileage;
	}

	public double getPrice() {
		return price;
	}

	public double getGallons() {
		return gallons;
	}

	public double getTotal() {
		return total;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setMileage(double mileage) {
		this.mileage = mileage;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setGallons(double gallons) {
		this.gallons = gallons;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getMpg() {
		return mpg;
	}

	public void setMpg(double mpg) {
		this.mpg = mpg;
	}
	
	
}
