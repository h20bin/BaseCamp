package org.mnu.domain;

import java.util.Date;
import lombok.Data;

@Data
public class BoardVO {
    private Long bno;
    private String title;
    private String content;
    private String writer;     // 화면에 이름 보여줄 때 사용
    
    // [추가됨] DB에 저장할 때 필요한 회원 아이디
    private String userId;     
    
    private Date regdate;
    private Date updateDate;
    private int viewcnt;
}