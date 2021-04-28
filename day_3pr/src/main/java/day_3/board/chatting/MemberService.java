package day_3.board.chatting;

public interface MemberService {
	 public void insertMember(MemberVO vo); 
	 public boolean checkId(String val);
	 public boolean login(MemberVO vo);
	  public String getName(String id);
}