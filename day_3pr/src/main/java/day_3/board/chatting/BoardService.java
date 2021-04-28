package day_3.board.chatting;

import java.util.HashMap;
import java.util.List;

public interface BoardService {
	public void insertBoard(BoardDTO dto);
	public BoardDTO getBoard(int seq);
	public List<BoardDTO> getBoardAll(int num[]);
	public void textareaRevise(BoardDTO dto);
}
