package kh.spring.chazazo.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.chazazo.chat.model.dao.ChatDao;
import kh.spring.chazazo.chat.model.dto.ChatDto;
import kh.spring.chazazo.chat.model.dto.ChatLogDto;
import kh.spring.chazazo.chat.model.dto.ChatRoomListDto;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao dao;

	@Override
	public List<ChatRoomListDto> chatRoomList() {
		return dao.chatRoomList();
	}
	
	@Override
	public int createRoom(Map<String, String> data) {
		return dao.createRoom(data);
	}

	@Override
	public int hasRoom(String username) {
		return dao.hasRoom(username);
	}

	@Override
	public String selectRoom(String username) {
		return dao.selectRoom(username);
	}
	
	@Override
	public int updateChat(Map<String, String> data) {
		return dao.updateChat(data);
	}
	
	@Override
	public List<ChatLogDto> selectChatList(String roomIdx) {
		return dao.selectChatList(roomIdx);
	}

	@Override
	public int insertChat(ChatDto chat) {
		return dao.insertChat(chat);
	}

	@Override
	public String checkAuth(String username) {
		return dao.checkAuth(username);
	}

	@Override
	public int countForAdmin() {
		return dao.countForAdmin();
	}

	@Override
	public int countForMember(String username) {
		return dao.countForMember(username);
	}

}
