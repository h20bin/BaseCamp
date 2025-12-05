package org.mnu.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mnu.domain.BatterVO;
import org.mnu.domain.GameVO; // GameVO 임포트
import org.mnu.domain.PitcherVO;
import org.mnu.domain.PlayerDTO;
import org.mnu.domain.TeamVO;

public interface RecordMapper {
    
    public List<TeamVO> getTeamRank();
    public List<BatterVO> getBatterRank();
    public List<PitcherVO> getPitcherRank();
    public List<TeamVO> getAllTeams();
    public List<PlayerDTO> getAllPlayers();
    public TeamVO getTeam(@Param("favTeamId") String favTeamId);
    public List<PlayerDTO> getInterestPlayers(String userId);

    // [추가] 경기 기록 조회
    public List<GameVO> getGameList();
}