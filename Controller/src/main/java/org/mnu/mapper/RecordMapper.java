package org.mnu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param; // @Param 임포트 추가
import org.mnu.domain.BatterVO;
import org.mnu.domain.PitcherVO;
import org.mnu.domain.PlayerDTO;
import org.mnu.domain.TeamVO;

public interface RecordMapper {
    
    // 팀 순위 조회
    public List<TeamVO> getTeamRank();
    
    // 타자 기록 조회
    public List<BatterVO> getBatterRank();
    
    // 투수 기록 조회
    public List<PitcherVO> getPitcherRank();
    
    public List<TeamVO> getAllTeams();
    public List<PlayerDTO> getAllPlayers();

    // [수정됨] @Param을 붙여서 XML의 #{favTeamId}와 정확히 연결해줍니다.
    public TeamVO getTeam(@Param("favTeamId") String favTeamId);
 // 맨 아래에 추가
    public List<PlayerDTO> getInterestPlayers1(String userId);

	public List<PlayerDTO> getInterestPlayers(String userId);
}