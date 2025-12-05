package org.mnu.domain;

import java.util.Date;
import lombok.Data;

@Data
public class GameVO {
    private String gameId;
    private Date gameDate;       
    private String homeTeamName; // 승리투수 팀
    private String awayTeamName; // 패배투수 팀
    
    // DB에는 score가 "7:5" 문자열 하나로 들어있지만, 
    // Mapper에서 g.SCORE as homeScore로 매핑하여 화면에 뿌려줍니다.
    private String homeScore;    
    private String awayScore;    
    
    private String stadium;
}