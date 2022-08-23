package com.human.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class HumanDto {
	private String name;
	private double height;
	private int age;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private List<HobbyDto> hobby;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public List<HobbyDto> getHobby() {
		return hobby;
	}

	public void setHobby(List<HobbyDto> hobby) {
		this.hobby = hobby;
	}

	@Override
	public String toString() {
		return "HumanDto [name=" + name + ", height=" + height + ", age=" + age + ", birth=" + birth + ", hobby="
				+ hobby + "]";
	}

}
