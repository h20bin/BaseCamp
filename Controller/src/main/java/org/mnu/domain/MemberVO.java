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
    private String nickName;    // ⭐ 닉네임 (추가됨)
    
    // [DB: EMAIL]
    private String email;       // 이메일
    
    // [DB: PHONE]
    private String phone;       // ⭐ 휴대폰 번호 (추가됨)
    
    // [DB: FAV_TEAM_ID]
    private String favTeamId;   // ⭐ 관심 구단 ID (FK) (추가됨)
    
    // [DB: REGDATE]
    private Date regDate;       // 등록일 (CREATED_AT)
    
    // [DB: UPDATEDATE]
    private Date updateDate;    // 수정일
    
    // [DB: ENABLED]
    private boolean enabled;    // 계정 활성화 여부

    // 참고: Lombok의 @Data가 Getter/Setter를 자동으로 생성하므로
    // 수동으로 추가된 public String getPassword() {} 메서드는 삭제했습니다.
}