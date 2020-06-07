package semicolon.com.bean;

import org.springframework.stereotype.Repository;

@Repository
public class PageBean {
	private int qnacurrentPage;
	private int noticecurrentPage;
	private int eventcurrentPage;

	private int qnatotalPage;
	private int noticetotalPage;
	private int eventtotalPage;

	private int qnacurrentBlock;
	private int noticecurrentBlock;
	private int eventcurrentBlock;
	
	private int qnastartPage;
	private int noticestartPage;
	private int eventstartPage;
	
	private int qnaendPage;
	private int noticeendPage;
	private int eventendPage;
	
	public PageBean() {
		super();
	}

	
	public PageBean(int qnacurrentPage, int noticecurrentPage, int eventcurrentPage, int qnatotalPage,
			int noticetotalPage, int eventtotalPage, int qnacurrentBlock, int noticecurrentBlock, int eventcurrentBlock,
			int qnastartPage, int noticestartPage, int eventstartPage, int qnaendPage, int noticeendPage,
			int eventendPage) {
		super();
		this.qnacurrentPage = qnacurrentPage;
		this.noticecurrentPage = noticecurrentPage;
		this.eventcurrentPage = eventcurrentPage;
		this.qnatotalPage = qnatotalPage;
		this.noticetotalPage = noticetotalPage;
		this.eventtotalPage = eventtotalPage;
		this.qnacurrentBlock = qnacurrentBlock;
		this.noticecurrentBlock = noticecurrentBlock;
		this.eventcurrentBlock = eventcurrentBlock;
		this.qnastartPage = qnastartPage;
		this.noticestartPage = noticestartPage;
		this.eventstartPage = eventstartPage;
		this.qnaendPage = qnaendPage;
		this.noticeendPage = noticeendPage;
		this.eventendPage = eventendPage;
	}


	public int getQnacurrentPage() {
		return qnacurrentPage;
	}

	public void setQnacurrentPage(int qnacurrentPage) {
		this.qnacurrentPage = qnacurrentPage;
	}

	public int getNoticecurrentPage() {
		return noticecurrentPage;
	}

	public void setNoticecurrentPage(int noticecurrentPage) {
		this.noticecurrentPage = noticecurrentPage;
	}

	public int getEventcurrentPage() {
		return eventcurrentPage;
	}

	public void setEventcurrentPage(int eventcurrentPage) {
		this.eventcurrentPage = eventcurrentPage;
	}

	public int getQnatotalPage() {
		return qnatotalPage;
	}

	public void setQnatotalPage(int qnatotalPage) {
		this.qnatotalPage = qnatotalPage;
	}

	public int getNoticetotalPage() {
		return noticetotalPage;
	}

	public void setNoticetotalPage(int noticetotalPage) {
		this.noticetotalPage = noticetotalPage;
	}

	public int getEventtotalPage() {
		return eventtotalPage;
	}

	public void setEventtotalPage(int eventtotalPage) {
		this.eventtotalPage = eventtotalPage;
	}

	public int getQnacurrentBlock() {
		return qnacurrentBlock;
	}

	public void setQnacurrentBlock(int qnacurrentBlock) {
		this.qnacurrentBlock = qnacurrentBlock;
	}

	public int getNoticecurrentBlock() {
		return noticecurrentBlock;
	}

	public void setNoticecurrentBlock(int noticecurrentBlock) {
		this.noticecurrentBlock = noticecurrentBlock;
	}

	public int getEventcurrentBlock() {
		return eventcurrentBlock;
	}

	public void setEventcurrentBlock(int eventcurrentBlock) {
		this.eventcurrentBlock = eventcurrentBlock;
	}

	public int getQnastartPage() {
		return qnastartPage;
	}

	public void setQnastartPage(int qnastartPage) {
		this.qnastartPage = qnastartPage;
	}

	public int getNoticestartPage() {
		return noticestartPage;
	}

	public void setNoticestartPage(int noticestartPage) {
		this.noticestartPage = noticestartPage;
	}

	public int getEventstartPage() {
		return eventstartPage;
	}

	public void setEventstartPage(int eventstartPage) {
		this.eventstartPage = eventstartPage;
	}

	public int getQnaendPage() {
		return qnaendPage;
	}

	public void setQnaendPage(int qnaendPage) {
		this.qnaendPage = qnaendPage;
	}

	public int getNoticeendPage() {
		return noticeendPage;
	}

	public void setNoticeendPage(int noticeendPage) {
		this.noticeendPage = noticeendPage;
	}

	public int getEventendPage() {
		return eventendPage;
	}

	public void setEventendPage(int eventendPage) {
		this.eventendPage = eventendPage;
	}
	

	@Override
	public String toString() {
		return "PageBean [qnacurrentPage=" + qnacurrentPage + ", noticecurrentPage=" + noticecurrentPage
				+ ", eventcurrentPage=" + eventcurrentPage + ", qnatotalPage=" + qnatotalPage + ", noticetotalPage="
				+ noticetotalPage + ", eventtotalPage=" + eventtotalPage + ", qnacurrentBlock=" + qnacurrentBlock
				+ ", noticecurrentBlock=" + noticecurrentBlock + ", eventcurrentBlock=" + eventcurrentBlock
				+ ", qnastartPage=" + qnastartPage + ", noticestartPage=" + noticestartPage + ", eventstartPage="
				+ eventstartPage + ", qnaendPage=" + qnaendPage + ", noticeendPage=" + noticeendPage + ", eventendPage="
				+ eventendPage + "]";
	}
	
	
	
	

}
