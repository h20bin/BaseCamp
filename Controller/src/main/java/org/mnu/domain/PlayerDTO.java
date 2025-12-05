package org.mnu.domain;

import lombok.Data;

@Data
public class PlayerDTO {
    private String playerId;    
    private String name;        
    private String teamName;    
    private String playerType;  
    
    // ▼▼▼ 아래 필드들이 반드시 있어야 합니다!!! ▼▼▼
    private String position;    // 포지션
    private Double avg;         // 타율 (null 처리를 위해 Double 사용)
    private Integer homerun;    // 홈런 (null 처리를 위해 Integer 사용)
    private Double era;         // 평균자책점
    private Integer strikeouts; // 탈삼진
    
    // (기존 관심선수용 필드는 유지)
    private String statLabel; 
    private String statValue; 
}