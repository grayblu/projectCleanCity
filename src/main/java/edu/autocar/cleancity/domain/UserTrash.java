package edu.autocar.cleancity.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserTrash {
	private String userid;
	private int cap;
	private Date emptyDate;
}
