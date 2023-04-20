package kh.spring.chazazo.reservation.model.service;

import java.util.List;
import java.util.Map;

import kh.spring.chazazo.reservation.model.dto.ReservationReqDto;
import kh.spring.chazazo.reservation.model.dto.ReservationRespDto;
import kh.spring.chazazo.review.model.dto.ReviewDto;
import kh.spring.chazazo.vehicle.model.dto.VehicleReqDto;
import kh.spring.chazazo.vehicle.model.dto.VehicleRespDto;

public interface ReservationService {
	


//	public List<ReservationRespDto> selectList();
	

	public List<ReservationRespDto> ReservationOne(int idx);
	public List<ReservationRespDto> selectList(String username);
	public int deleteResv(int idx);
	public int insertPayInfo(ReservationReqDto data);
	public int insertNmemInfo(ReservationReqDto data);



}
