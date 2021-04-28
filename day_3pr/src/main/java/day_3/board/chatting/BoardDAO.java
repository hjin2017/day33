package day_3.board.chatting;

import java.lang.invoke.CallSite;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("bDao")
public class BoardDAO {
	  @Autowired 
	  SqlSession session;
	 public void insertBoard(BoardDTO dto) {session.insert("day3_rpg.insertBoard", dto);}
	 public BoardDTO getBoard(int seq) {return session.selectOne("day3_rpg.getBoard", seq);}
	 public List<BoardDTO> getBoardAll(int num[]) {return session.selectList("day3_rpg.getBoardAll",num);}
	 public void textareaRevise(BoardDTO dto) {session.update("day3_rpg.textareaRevise",dto);}

}
