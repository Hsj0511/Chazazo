package kh.spring.chazazo.payment.model.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;


@Component
@Data
public class PaymentReqDto {
	private int idx;

	private String daycount;
	private String rentPrice;
	private String addIns;
	private String expIns;
	private int vehicleIdx;
	private int insurance;
	
	private int ismember;
	private int memberIdx;
	private String name;
	private int birth;
	private String phone;
	private String email;
	private String license;
	private int finalprice;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date paidtime;
	
	private int rentLocation;
	private int returnLocation;
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date startDate;
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date endDate;
}
