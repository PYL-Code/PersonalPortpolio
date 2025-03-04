<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String uploadPath = "C:/PYL/PortfolioImgUpload";
	
	File uploadDir = new File(uploadPath);
	if (!uploadDir.exists()) {
	    uploadDir.mkdirs();
	}
	
	int size = 10 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
	
	String post_txt = multi.getParameter("post_txt");
	String imgname = multi.getFilesystemName("post_img");
	
	if (post_txt == null || post_txt.equals("null")) {
		post_txt = "";
    }
	
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "insert into post (post_imgname, post_txt, post_date, post_like) values (?, ?, current_date(), 0)";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, "root", "1234");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, imgname);
		pstmt.setString(2, post_txt);
		//System.out.println(post_txt);
		pstmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("uploadPost_form.jsp");
	} finally {
		if(rset != null) {try {rset.close(); } catch(SQLException e) {e.printStackTrace();}}
		if(pstmt != null) {try {pstmt.close(); } catch(SQLException e) {e.printStackTrace();}}
		if(conn != null) {try {conn.close(); } catch(SQLException e) {e.printStackTrace();}}
	}
	response.sendRedirect("index.jsp");
%>