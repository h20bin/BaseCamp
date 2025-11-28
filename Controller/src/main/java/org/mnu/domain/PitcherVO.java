package org.mnu.domain;

import lombok.Data;

@Data
public class PitcherVO {
    private String playerId;    // 선수 ID (PK)
    private String teamId;      // 소속 구단 ID (FK)
    private String name;        // 선수 이름
    private int wins;           // 승
    private int losses;         // 패
    private int strikeouts;     // 탈삼진
    private double innings;     // 이닝
    private double era;         // 평균자책점

    // 조인을 위한 필드 추가
    private String teamName;
}