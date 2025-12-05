package org.mnu.domain;

import java.util.Date;
import lombok.Data;

@Data
public class BoardVO {

    private Long bno;
    private String title;
    private String content;
    private String writer;      // 작성자 이름
    private String userId;      // 작성자 ID (회원가입 연동 시 필요)

    private Date regdate;
    private Date updateDate;
    private int viewcnt;
    
    private String fileName;    // 첨부파일 이름
    private int reportCnt;      // 신고 수
    private String isNotice;    // 공지 여부 (Y/N)

    // ★ [핵심 수정] 변수만 선언하면 Lombok(@Data)이 알아서 채워줍니다.
    // 기존에 있던 이상한 getCategory(), setCategory() 메서드는 다 지웠습니다.
    private String category;    
}