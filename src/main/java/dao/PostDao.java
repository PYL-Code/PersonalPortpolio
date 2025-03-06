package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.PostDto;
import util.DBConnection;

public class PostDao {
	
	public ArrayList<PostDto> selectAllPost(){
		ArrayList<PostDto> list = new ArrayList<>();
		String sql_post = "select * from post";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql_post);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				PostDto post = new PostDto(
						rs.getInt("post_no"),
						rs.getString("post_imgname"),
						rs.getString("post_txt"),
						rs.getString("post_date"),
						rs.getInt("post_like")
				);
				list.add(post);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void uploadPost() {
		
	}
	
	public void addLikePost() {
		
	}
}
