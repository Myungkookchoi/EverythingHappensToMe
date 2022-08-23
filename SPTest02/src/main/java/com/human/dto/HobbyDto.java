package com.human.dto;

//import java.util.List;

public class HobbyDto {
	private String name;
	private String hobby;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	@Override
	public String toString() {
		return "HobbyDto [name=" + name + ", hobby=" + hobby + "]";
	}

}
