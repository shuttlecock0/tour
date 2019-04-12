package edu.autocar.domain;

import lombok.Getter;

@Getter
public enum UserLevel {
	ADMIN("ADMIN","관리자"),
	NORMAL("NORMAL","일반"),
	SILVER("SILVER","실버"),
	GOLD("GOLD","골드");
	
	private String value;
	private String label;
	
	private UserLevel(String value, String label) {
		this.value = value;
		this.label = label;
	}
}
