package org.mnu.domain;

import java.util.Date;
import lombok.Data;

@Data
public class BoardVO {
    private Long bno;
    private String title;
    private String content;
    private String writer;     // 화면에 이름 보여줄 때 사용
    
    private String userId;     // DB에 저장할 때 필요한 회원 아이디
    
    private Date regdate;
    private Date updateDate;
    private int viewcnt;
    
    // ★ [추가됨] 파일 업로드 및 신고 기능용 필드
    private String fileName;   // 업로드된 이미지 파일명 (UUID_원본이름)
    private int reportCnt;     // 게시글 신고 횟수
    private String isNotice;
	public Object getCategory() {
		// TODO Auto-generated method stub
		return null;
	}
	public void setCategory(String string) {
		// TODO Auto-generated method stub
		
	}
}