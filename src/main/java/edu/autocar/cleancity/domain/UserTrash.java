package edu.autocar.cleancity.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserTrash {
	private String userid;
	private int cap;
	private Date emptyDate;
	
}
