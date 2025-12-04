package org.mnu.domain;

import java.util.Date;
import lombok.Data;

@Data
public class MessageVO {
    private Long msgId;
    private String targetId;  // 받는 사람
    private String senderId;  // 보낸 사람 (admin 등)
    private String content;   // 내용
    private Date sendDate;    // 보낸 날짜
    private String isRead;    // 읽음 여부 (Y/N)
}