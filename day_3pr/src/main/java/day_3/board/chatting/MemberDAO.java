package day_3.board.chatting;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mdao")
public class MemberDAO {
	
	  @Autowired 
	  SqlSession session;
	
	  public void insertMember(MemberVO vo) { session.insert("day3_rpg.insertMember",vo);  }
	  public boolean checkId(String val) {return  session.selectOne("day3_rpg.check", val)==null;}
	  public boolean login(MemberVO vo) {return  session.selectOne("day3_rpg.login", vo)==null;}
	  public String getName(String id) {return  session.selectOne("day3_rpg.getName", id);}
	  
}
