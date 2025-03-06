package dto;

public class PostDto {
	private int postNo;
	private String postImgName;
	private String postTxt;
	private String postDate;
	private int postLike;
	
	public PostDto(int postNo, String postImgName, String postTxt, String postDate, int postLike) {
		super();
		this.postNo = postNo;
		this.postImgName = postImgName;
		this.postTxt = postTxt;
		this.postDate = postDate;
		this.postLike = postLike;
	}
	
	public int getPostNo() { return postNo; }
	public void setPostNo(int postNo) { this.postNo = postNo; }
	public String getPostImgName() { return postImgName; }
	public void setPostImgName(String postImgName) { this.postImgName = postImgName; }
	public String getPostTxt() { return postTxt; }
	public void setPostTxt(String postTxt) { this.postTxt = postTxt; }
	public String getPostDate() { return postDate; }
	public void setPostDate(String postDate) { this.postDate = postDate; }
	public int getPostLike() { return postLike; }
	public void setPostLike(int postLike) { this.postLike = postLike; }
	
}
