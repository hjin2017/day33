package day_3.board.chatting;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	
	 
	@Autowired
	MemberService mservice;
	@Autowired
	BoardService bService;
	
	HttpSession  session =null;
	
	@RequestMapping("/day3pr")
	public String webmain() {
		
		return "main";
	}
	
	@RequestMapping(value = "/singUp",method = RequestMethod.POST,produces ={"applcation/json;charset=utf-8" })
	@ResponseBody
	public String webSign_Update(String id ,String email,String pw ,String name) {
		 mservice.insertMember(new MemberVO(id,email,pw,name)); 
		return "{\"process\":\"가입되었습니다.\"}";
	}
	
	@RequestMapping(value = "/singUpid",method = RequestMethod.POST,produces ={"applcation/json;charset=utf-8" })
	@ResponseBody
	public String webSign_Upid(String val) {
		boolean ischeck = mservice.checkId(val);
		 return "{\"process\":\""+ischeck+"\"}"; 
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.POST,produces ={"applcation/json;charset=utf-8" })
	@ResponseBody
	public String login(String id, String pw ,HttpServletRequest request, HttpServletResponse response) throws Exception{
		session = request.getSession();
		 MemberVO vo = new MemberVO();
		 vo.setId(id);
		 vo.setPw(pw);
		 boolean isOk = mservice.login(vo);
		 if(!isOk) session.setAttribute("name", mservice.getName(id));
		 
		 return "{\"process\":\""+isOk+"\"}"; 
	}
	
	@RequestMapping(value = "/textareaWrite",method = RequestMethod.POST,produces ={"applcation/json;charset=utf-8" })
	@ResponseBody
	public String textareaWrite(String title,String contents,String writer) {
		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setContents(contents);
		dto.setWriter("마스터");
		bService.insertBoard(dto);
	   return "{\"process\":\"정상적으로 저장되었습니다.\"}"; 
	}
	
	@RequestMapping("/textareaRead")
	@ResponseBody
	public BoardDTO textareaRead(int seq) {
	   return bService.getBoard(seq); 
	}
	
	@RequestMapping("/textareaReadALL")
	@ResponseBody
	public ArrayList<BoardDTO> textareaReadALL(int first,int second) {
	   int setpage[] = {first,second};
	   ArrayList<BoardDTO> arrDto = (ArrayList<BoardDTO>)bService.getBoardAll(setpage); 
	   return arrDto;
	}
	
	@RequestMapping(value = "/getSession",method = RequestMethod.POST,produces ={"applcation/json;charset=utf-8" })
	@ResponseBody
	public String getName() {
		if(session.getAttribute("name")==null)
			return "{\"process\":\"없음\"}"; 
		else
			return "{\"process\":\""+session.getAttribute("name")+"\"}"; 
	}
	
	@RequestMapping("/setName")
	@ResponseBody
	public void setName(String name) {
		session.setAttribute("name",name);
	}
	
	@RequestMapping(value = "/textareaRevise",method = RequestMethod.POST,produces ={"applcation/json;charset=utf-8" })
	@ResponseBody
	public String textareaRevise(String contents ,String seq) {
		 String str[] =seq.split("|");
		 BoardDTO dto =new BoardDTO();
		 dto.setContents(contents);
		 dto.setSeq(Integer.parseInt(str[0]));
		 bService.textareaRevise(dto);
		return "{\"process\":\"성공하셨습니다\"}"; 
	}
}