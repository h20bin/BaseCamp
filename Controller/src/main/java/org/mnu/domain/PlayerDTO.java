package org.mnu.domain;

import lombok.Data;

@Data
public class PlayerDTO {
    private String playerId;    // PLAYER_ID
    private String name;        // NAME
    private String teamName;    // TEAM_NAME (조인을 통해 가져옴)
    private String playerType;  // PLAYER_TYPE (타자 또는 투수)
 // PlayerDTO.java 안에 추가하세요
    private String statLabel; // 예: "타율" 또는 "평균자책점"
    private String statValue; // 예: "0.312" 또는 "2.45"
}