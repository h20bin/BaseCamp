package org.mnu.service;

import java.util.List;
import org.mnu.domain.BatterVO;
import org.mnu.domain.PitcherVO;
import org.mnu.domain.PlayerDTO;
import org.mnu.domain.TeamVO;

public interface RecordService {
    public List<TeamVO> getTeamRankings();
    public List<BatterVO> getBatterRankings();
    public List<PitcherVO> getPitcherRankings();
    public List<TeamVO> getAllTeams();
    public List<PlayerDTO> getAllPlayers();
	public Object getTeam(String favTeamId);
}