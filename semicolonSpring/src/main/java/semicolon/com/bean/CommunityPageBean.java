package semicolon.com.bean;

import org.springframework.stereotype.Repository;

@Repository
public class CommunityPageBean {
	private int qnacurrentPage;
	private int qnatotalPage;
	private int qnacurrentBlock;
	private int qnastartPage;
	private int qnaendPage;
	
	private int eventcurrentPage;
	private int eventtotalPage;
	private int eventcurrentBlock;
	
	private int eventstartPage;
	private int eventendPage;

	private int noticecurrentPage;
	private int noticetotalPage;
	private int noticecurrentBlock;
	private int noticestartPage;
	private int noticeendPage;
	
	
	public CommunityPageBean() {
		super();
	}

	public CommunityPageBean(int qnacurrentPage, int qnatotalPage, int qnacurrentBlock, int qnastartPage,
			int qnaendPage, int eventcurrentPage, int eventtotalPage, int eventcurrentBlock, int eventstartPage,
			int eventendPage, int noticecurrentPage, int noticetotalPage, int noticecurrentBlock, int noticestartPage,
			int noticeendPage) {
		super();
		
		this.qnacurrentPage = qnacurrentPage;
		this.qnatotalPage = qnatotalPage;
		this.qnacurrentBlock = qnacurrentBlock;
		this.qnastartPage = qnastartPage;
		this.qnaendPage = qnaendPage;
		this.eventcurrentPage = eventcurrentPage;
		this.eventtotalPage = eventtotalPage;
		this.eventcurrentBlock = eventcurrentBlock;
		this.eventstartPage = eventstartPage;
		this.eventendPage = eventendPage;
		this.noticecurrentPage = noticecurrentPage;
		this.noticetotalPage = noticetotalPage;
		this.noticecurrentBlock = noticecurrentBlock;
		this.noticestartPage = noticestartPage;
		this.noticeendPage = noticeendPage;
	}


	
	public int getQnacurrentPage() {
		return qnacurrentPage;
	}

	public void setQnacurrentPage(int qnacurrentPage) {
		this.qnacurrentPage = qnacurrentPage;
	}

	public int getQnatotalPage() {
		return qnatotalPage;
	}

	public void setQnatotalPage(int qnatotalPage) {
		this.qnatotalPage = qnatotalPage;
	}

	public int getQnacurrentBlock() {
		return qnacurrentBlock;
	}

	public void setQnacurrentBlock(int qnacurrentBlock) {
		this.qnacurrentBlock = qnacurrentBlock;
	}

	public int getQnastartPage() {
		return qnastartPage;
	}

	public void setQnastartPage(int qnastartPage) {
		this.qnastartPage = qnastartPage;
	}

	public int getQnaendPage() {
		return qnaendPage;
	}

	public void setQnaendPage(int qnaendPage) {
		this.qnaendPage = qnaendPage;
	}

	public int getEventcurrentPage() {
		return eventcurrentPage;
	}

	public void setEventcurrentPage(int eventcurrentPage) {
		this.eventcurrentPage = eventcurrentPage;
	}

	public int getEventtotalPage() {
		return eventtotalPage;
	}

	public void setEventtotalPage(int eventtotalPage) {
		this.eventtotalPage = eventtotalPage;
	}

	public int getEventcurrentBlock() {
		return eventcurrentBlock;
	}

	public void setEventcurrentBlock(int eventcurrentBlock) {
		this.eventcurrentBlock = eventcurrentBlock;
	}

	public int getEventstartPage() {
		return eventstartPage;
	}

	public void setEventstartPage(int eventstartPage) {
		this.eventstartPage = eventstartPage;
	}

	public int getEventendPage() {
		return eventendPage;
	}

	public void setEventendPage(int eventendPage) {
		this.eventendPage = eventendPage;
	}

	public int getNoticecurrentPage() {
		return noticecurrentPage;
	}

	public void setNoticecurrentPage(int noticecurrentPage) {
		this.noticecurrentPage = noticecurrentPage;
	}

	public int getNoticetotalPage() {
		return noticetotalPage;
	}

	public void setNoticetotalPage(int noticetotalPage) {
		this.noticetotalPage = noticetotalPage;
	}

	public int getNoticecurrentBlock() {
		return noticecurrentBlock;
	}

	public void setNoticecurrentBlock(int noticecurrentBlock) {
		this.noticecurrentBlock = noticecurrentBlock;
	}

	public int getNoticestartPage() {
		return noticestartPage;
	}

	public void setNoticestartPage(int noticestartPage) {
		this.noticestartPage = noticestartPage;
	}

	public int getNoticeendPage() {
		return noticeendPage;
	}

	public void setNoticeendPage(int noticeendPage) {
		this.noticeendPage = noticeendPage;
	}

	@Override
	public String toString() {
		return "CommunityPageBean [qnacurrentPage=" + qnacurrentPage + ", qnatotalPage=" + qnatotalPage
				+ ", qnacurrentBlock=" + qnacurrentBlock + ", qnastartPage=" + qnastartPage + ", qnaendPage="
				+ qnaendPage + ", eventcurrentPage=" + eventcurrentPage + ", eventtotalPage=" + eventtotalPage
				+ ", eventcurrentBlock=" + eventcurrentBlock + ", eventstartPage=" + eventstartPage + ", eventendPage="
				+ eventendPage + ", noticecurrentPage=" + noticecurrentPage + ", noticetotalPage=" + noticetotalPage
				+ ", noticecurrentBlock=" + noticecurrentBlock + ", noticestartPage=" + noticestartPage
				+ ", noticeendPage=" + noticeendPage + "]";
	}


	
	
}
