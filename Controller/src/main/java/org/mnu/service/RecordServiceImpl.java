package org.mnu.service;

import java.util.List;

import org.mnu.domain.BatterVO;
import org.mnu.domain.PitcherVO;
import org.mnu.domain.PlayerDTO;
import org.mnu.domain.TeamVO;
import org.mnu.mapper.RecordMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor 
public class RecordServiceImpl implements RecordService {

    // @AllArgsConstructor 덕분에 생성자 주입 자동 처리
    private final RecordMapper mapper;

    @Override
    public List<TeamVO> getTeamRankings() {
        log.info("팀 순위 조회 (Service)");
        return mapper.getTeamRank();
    }

    @Override
    public List<BatterVO> getBatterRankings() {
        log.info("타자 순위 조회 (Service)");
        return mapper.getBatterRank();
    }

    @Override
    public List<PitcherVO> getPitcherRankings() {
        log.info("투수 순위 조회 (Service)");
        return mapper.getPitcherRank();
    }
    
    @Override
    public List<TeamVO> getAllTeams() {
        log.info("회원가입용 구단 목록 조회 (Service)");
        return mapper.getAllTeams();
    }
    
    @Override
    public List<PlayerDTO> getAllPlayers() { 
        log.info("회원가입용 선수 목록 조회 (Service)");
        return mapper.getAllPlayers();
    }

    // ▼▼▼ [수정] 인터페이스와 동일하게 TeamVO 반환 ▼▼▼
    @Override
    public TeamVO getTeam(String favTeamId) {
        log.info("관심 구단 정보 조회 서비스: " + favTeamId);
        return mapper.getTeam(favTeamId);
    }
}