package org.mnu.mapper;

import java.util.List;
import org.mnu.domain.BatterVO;
import org.mnu.domain.PitcherVO;
import org.mnu.domain.PlayerDTO;
import org.mnu.domain.TeamVO;

public interface RecordMapper {
    // 팀 순위 조회
    public List<TeamVO> getTeamRank();
    
    // 타자 기록 조회 (타율 순 정렬 등)
    public List<BatterVO> getBatterRank();
    
    // 투수 기록 조회 (다승 순 정렬 등)
    public List<PitcherVO> getPitcherRank();
    
    public List<TeamVO> getAllTeams();
    public List<PlayerDTO> getAllPlayers();
}