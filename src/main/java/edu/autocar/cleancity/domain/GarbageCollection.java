package edu.autocar.cleancity.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GarbageCollection {
	int collectionNo;
	String userid;
	double cap;
	String address;
	Date emptyDate;
	
}
