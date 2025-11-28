package org.mnu.domain;

import lombok.Data;

@Data
public class PlayerDTO {
    private String playerId;    // PLAYER_ID
    private String name;        // NAME
    private String teamName;    // TEAM_NAME (조인을 통해 가져옴)
    private String playerType;  // PLAYER_TYPE (타자 또는 투수)
}