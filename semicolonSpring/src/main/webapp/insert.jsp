<%@page import="semicolon.com.dao.AppleDao"%>
<%@page import="semicolon.com.bean.SemiEventBean"%>
<%@page import="semicolon.com.bean.SemiNoticeBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="semicolon.com.bean.SemiQnaBean"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
	AppleDao appleDao = (AppleDao) request.getAttribute("appleDao");
	
		request.setCharacterEncoding("EUC-KR");

		int no = 0 ;
		String path = "D:\\TAEHOON_JAVA_DBMS\\Semicolon2\\team\\WebContent\\semiupload\\";

			String type = request.getParameter("type");
			String mode = request.getParameter("mode");
			String pageData = request.getParameter("page");
			
	
		if(type.equals("eprogress")){
			
			int eno = Integer.parseInt(request.getParameter("no"));
			appleDao.updateEprogress(eno);
			
			response.sendRedirect("communityList.do?page="+pageData+"&type=event");
		}
		else if (FileUpload.isMultipartContent(request)) {
			DiskFileUpload diskFileUpload = new DiskFileUpload();
			diskFileUpload.setRepositoryPath(path);
			diskFileUpload.setSizeMax(1024 * 1024 * 5);
			List<FileItem> list = diskFileUpload.parseRequest(request);

			
			/* 게시판별 분기*/
			if (type.equals("qna")) {
				SemiQnaBean qnaBean = new SemiQnaBean();
			
		    if(mode.equals("new")||mode.equals("reply")){
				qnaBean.setQno(appleDao.getQnaSequence());
			}
				for (FileItem fileItem : list) {
					String name = fileItem.getFieldName();
					if(mode.equals("modify")){
						if(name.equals("no")){
							no = Integer.parseInt(fileItem.getString("EUC-KR"));
							qnaBean.setQno(no);
						}
					}
					if (mode.equals("reply")) {
						if (name.equals("ref")) {
							qnaBean.setRef(Integer.parseInt(fileItem.getString("EUC-KR")));
						}
						if (name.equals("step")) {
							qnaBean.setStep(Integer.parseInt(fileItem.getString("EUC-KR")));
						}
						if (name.equals("lev")) {
							qnaBean.setLev(Integer.parseInt(fileItem.getString("EUC-KR")));
						}
						if (name.equals("pnum")) {
							qnaBean.setPnum(Integer.parseInt(fileItem.getString("EUC-KR")));
						}
					}
					if (name.equals("id")) {
						qnaBean.setId(fileItem.getString("EUC-KR"));
					}
					if (name.equals("title")) {
						qnaBean.setQtitle(fileItem.getString("EUC-KR"));
					}
					if (name.equals("selectproduct")) {
						qnaBean.setPno(Integer.parseInt(fileItem.getString("EUC-KR")));
					}
					if (name.equals("contents")) {
						qnaBean.setQcontents(fileItem.getString("EUC-KR"));
					}
					String fileName = "";
					//         	String fixFile="";
					if (!fileItem.isFormField()) {//input file
						if (fileItem.getName().length() == 0)
							continue;
						fileName = (System.currentTimeMillis() + fileItem.getName());
						//         		    fixFile+=fileName+"#";
						File file = new File(path + fileName);
						try {
							fileItem.write(file);
							qnaBean.setQfilename(fileName);

						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				} //for

				qnaBean.setQfilename(qnaBean.getQfilename() == null ? "noimg.jpg" : qnaBean.getQfilename());

				if (mode.equals("new")) {
					qnaBean.setRef(qnaBean.getQno());
					qnaBean.setPnum(qnaBean.getQno());

				} else if (mode.equals("reply")) {

					//updateReply
					HashMap<String, Object> map = new HashMap<String, Object>();

					/* 부모의 REPLY값 변화*/
					map.put("num", qnaBean.getPnum());
					map.put("mode", "reply");
					/* ref들의 step변화 */
					map.put("ref", qnaBean.getRef());
					map.put("step", qnaBean.getStep());
					//updateStep
					appleDao.updateStep(map);
					appleDao.updateReply(map);
					appleDao.updateQstate(qnaBean.getRef());
					
					qnaBean.setStep(qnaBean.getStep() + 1);
					qnaBean.setLev(qnaBean.getLev() + 1);
				} else if (mode.equals("modify")) {
					       appleDao.updateQna(qnaBean);
					       response.sendRedirect("qnaContents.do?no="+no);
				} 
				if (!mode.equals("modify")) {
					int cno = appleDao.getCnoFromPno(qnaBean.getPno());
					qnaBean.setCno(cno);
					appleDao.insertQna(qnaBean);
					response.sendRedirect("communityList.do?page="+pageData+"&type="+type);
				}

			} else if (type.equals("notice")) {

				SemiNoticeBean noticeBean = new SemiNoticeBean();
				if(mode.equals("new")){
				noticeBean.setNno(appleDao.getNoticeSequence());
				}
				for (FileItem fileItem : list) {
					String name = fileItem.getFieldName();
					if(mode.equals("modify")){
						if(name.equals("no")){
							no = Integer.parseInt(fileItem.getString("EUC-KR"));
							noticeBean.setNno(no);
						}
					}
					if (name.equals("id")) {
						noticeBean.setId(fileItem.getString("EUC-KR"));
					}
					if (name.equals("title")) {
						noticeBean.setNtitle(fileItem.getString("EUC-KR"));
					}
					if (name.equals("contents")) {
						noticeBean.setNcontents(fileItem.getString("EUC-KR"));
					}

				} //for

				if (mode.equals("modify")) {
					   appleDao.updateNotice(noticeBean);
				       response.sendRedirect("noticeContents.do?no="+no);
				}
				if (!mode.equals("modify")) {

					appleDao.insertNotice(noticeBean);
					response.sendRedirect("communityList.do?page=" + pageData + "&type=" + type);
				}

			} else if (type.equals("event")) {

				SemiEventBean eventBean = new SemiEventBean();
				if(mode.equals("new")){
				eventBean.setEno(appleDao.getEventSequence());
				}
				for (FileItem fileItem : list) {
					String name = fileItem.getFieldName();
					if(mode.equals("modify")){
						if(name.equals("no")){
							no = Integer.parseInt(fileItem.getString("EUC-KR"));
							eventBean.setEno(no);
						}
					}
					if (name.equals("id")) {
						eventBean.setId(fileItem.getString("EUC-KR"));
					}
					if (name.equals("title")) {
						eventBean.setEtitle(fileItem.getString("EUC-KR"));
					}
					if (name.equals("contents")) {
						eventBean.setEcontents(fileItem.getString("EUC-KR"));
					}
					String fileName = "";
					if (!fileItem.isFormField()) {//input file
						if (fileItem.getName().length() == 0)
							continue;
						fileName = (System.currentTimeMillis() + fileItem.getName());
						//         		    fixFile+=fileName+"#";
						File file = new File(path + fileName);
						try {
							fileItem.write(file);
							eventBean.setEfilename(fileName);

						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				} //for
				eventBean.setEfilename(eventBean.getEfilename() == null ? "noimg.jpg" : eventBean.getEfilename());

				if (mode.equals("modify")) {
					   appleDao.updateEvent(eventBean);
				       response.sendRedirect("eventContents.do?no="+no);
					
				}
				if (!mode.equals("modify")) {
					eventBean.setEprogress("true");
					appleDao.insertEvent(eventBean);
					response.sendRedirect("communityList.do?page=" + pageData + "&type=" + type);
				}
			}

		}
	%>
</body>
</html>