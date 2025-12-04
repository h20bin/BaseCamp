package org.mnu.domain;

import java.util.Date;
import lombok.Data;

@Data
public class MemberVO {
    
    // [DB: USER_ID]
    private String userId;      // 사용자 아이디 (PK)
    
    // [DB: PASSWORD]
    private String userPw;      // 비밀번호
    
    // [DB: NAME]
    private String userName;    // 사용자 이름
    
    // [DB: NICKNAME]
    private String nickName;    // 닉네임
    
    // [DB: EMAIL]
    private String email;       // 이메일
    
    // [DB: PHONE]
    private String phone;       // 휴대폰 번호
    
    // [DB: FAV_TEAM_ID]
    private String favTeamId;   // 관심 구단 ID (FK)
    
    // [DB: REGDATE]
    private Date regDate;       // 등록일
    
    // [DB: UPDATEDATE]
    private Date updateDate;    // 수정일
    
    // [DB: ENABLED]
    private boolean enabled;    // 계정 활성화 여부

    // [DB: AUTH]
    private String auth;        // 관리자 권한

    // ★ [추가됨] 경고 시스템용 변수
    private int warningCnt;      // 경고 횟수 (기본 0)
    private Date banUntil;       // 활동 정지 종료일 (이 날짜 전까지 글쓰기 금지)
}