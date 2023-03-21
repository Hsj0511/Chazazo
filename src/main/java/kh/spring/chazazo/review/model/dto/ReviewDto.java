package kh.spring.chazazo.review.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReviewDto {
	
	private int idx;
	private int vehicleIdx;
	private String content;
	private Date reviewdate;
	private int reviewlike;
	
}