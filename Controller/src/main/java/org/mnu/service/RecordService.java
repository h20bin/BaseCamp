package org.mnu.service;

import java.util.List;
import org.mnu.domain.BatterVO;
import org.mnu.domain.GameVO; // GameVO 임포트 확인
import org.mnu.domain.PitcherVO;
import org.mnu.domain.PlayerDTO;
import org.mnu.domain.TeamVO;

public interface RecordService {
    public List<TeamVO> getTeamRankings();
    public List<BatterVO> getBatterRankings();
    public List<PitcherVO> getPitcherRankings();
    public List<TeamVO> getAllTeams();
    public List<PlayerDTO> getAllPlayers();
    
    public TeamVO getTeam(String favTeamId);
    public List<PlayerDTO> getInterestPlayers(String userId);

    // [추가] 경기 기록 조회
    public List<GameVO> getGameList();
}