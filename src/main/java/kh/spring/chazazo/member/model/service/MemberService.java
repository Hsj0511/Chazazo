package kh.spring.chazazo.member.model.service;

import kh.spring.chazazo.member.model.dto.MemberReqDto;
import kh.spring.chazazo.member.model.dto.MemberUpdateInfoRespDto;

import java.util.List;

import kh.spring.chazazo.member.model.dto.MemberInfoReqDto;
import kh.spring.chazazo.member.model.dto.MemberInfoRespDto;

public interface MemberService {
	
	public int insert(MemberReqDto memberDto, MemberInfoReqDto memberInfoDto);
	public int checkDup(String username);
	public List<String> findId(String email);
	public String forFindPass(String username);
	public int findPass(String username, String password);
	public MemberInfoRespDto selectOne(int idx);
	public MemberInfoRespDto selectMypageOne(String username);
	public String userPass(String username);
	public MemberInfoRespDto getMemberInfo(String username);
	public int updateInfo(MemberUpdateInfoRespDto dto);
	public int deleteMember(String username);
//	public int deleteMemberInfo(String username);
}
