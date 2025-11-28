package org.mnu.domain;

import lombok.Data;

@Data
public class BatterVO {
    private String playerId;    // 선수 ID (PK)
    private String teamId;      // 소속 구단 ID (FK)
    private String name;        // 선수 이름
    private String position;    // 포지션
    private double avg;         // 타율
    private int homerun;        // 홈런
    private int runs;           // 득점
    private int rbi;            // 타점
    
    // 조인을 위한 필드 추가 (화면에 팀 이름을 보여주기 위함)
    private String teamName;
}