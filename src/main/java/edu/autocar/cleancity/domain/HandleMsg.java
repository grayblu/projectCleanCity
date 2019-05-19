package edu.autocar.cleancity.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HandleMsg {
	String type;
	String message;
	String userid;
	double cap;
}
