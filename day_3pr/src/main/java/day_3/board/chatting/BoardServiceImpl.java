package day_3.board.chatting;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAO dao;
	@Override
	public void insertBoard(BoardDTO dto) {dao.insertBoard(dto);}
	@Override
	public BoardDTO getBoard(int seq) {return dao.getBoard(seq);}
	@Override
	public List<BoardDTO> getBoardAll(int num[]) {return dao.getBoardAll(num);}
	@Override
	public void textareaRevise(BoardDTO dto) {dao.textareaRevise(dto);}
}
