package org.mnu.domain;

import lombok.Data;

@Data
public class TeamVO {
    private String teamId;      // 구단 식별 코드 (PK)
    private String teamName;    // 구단 명칭
    private int rankNo;         // 팀 순위 (RANK는 예약어라 rankNo로 변경 권장)
    private int wins;           // 승리
    private int draws;          // 무승부
    private int losses;         // 패배
    private double winRate;     // 승률
    private double teamAvg;     // 팀 타율
}