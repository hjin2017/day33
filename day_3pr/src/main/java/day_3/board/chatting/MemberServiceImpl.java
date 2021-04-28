package day_3.board.chatting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mservice")
public class MemberServiceImpl implements MemberService {
	
	  @Autowired 
	  MemberDAO mdao;
	  
	  @Override 
	  public void insertMember(MemberVO vo) { mdao.insertMember(vo);}
	  @Override 
	  public boolean checkId(String val) {return mdao.checkId(val);}
	  @Override 
	  public boolean login(MemberVO vo) {return  mdao.login(vo);}
	  @Override 
	  public String getName(String id) {return mdao.getName(id);}
	 
}
