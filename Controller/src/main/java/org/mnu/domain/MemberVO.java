package org.mnu.domain;

import java.util.Date;
import lombok.Data;

@Data
public class MemberVO {
    private String userId;      // 회원 아이디 (PK)
    private String userPw;      // 비밀번호
    private String userName;    // 이름
    private String email;       // 이메일
    private Date regDate;       // 등록일
    private Date updateDate;    // 수정일
    private boolean enabled;    // 계정 활성화 여부
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}
}