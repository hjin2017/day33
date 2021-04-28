package day_3.board.chatting;

import org.springframework.stereotype.Component;

@Component("bDto")
public class BoardDTO {
int seq,viewcount,likecount,hatecount;
String title,contents,writer;

public BoardDTO() {}

public BoardDTO(int seq, int viewcount, int likecount, int hatecount, String title, String contents, String writer) {
	this.seq = seq;
	this.viewcount = viewcount;
	this.likecount = likecount;
	this.hatecount = hatecount;
	this.title = title;
	this.contents = contents;
	this.writer = writer;
}
public int getSeq() {
	return seq;
}
public void setSeq(int seq) {
	this.seq = seq;
}
public int getViewcount() {
	return viewcount;
}
public void setViewcount(int viewcount) {
	this.viewcount = viewcount;
}
public int getLikecount() {
	return likecount;
}
public void setLikecount(int likecount) {
	this.likecount = likecount;
}
public int getHatecount() {
	return hatecount;
}
public void setHatecount(int hatecount) {
	this.hatecount = hatecount;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
}
