package org.mnu.service;

import java.util.List;
import org.mnu.domain.BatterVO;
import org.mnu.domain.PitcherVO;
import org.mnu.domain.TeamVO;
import org.mnu.domain.PlayerDTO; // 🌟 PlayerDTO 임포트가 필요합니다.
import org.mnu.mapper.RecordMapper;
import org.springframework.stereotype.Service;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor // 생성자 주입을 위해 사용
public class RecordServiceImpl implements RecordService {

    // final로 선언하여 생성자 주입을 받습니다. (NullPointerException 방지)
    private final RecordMapper mapper;

    @Override
    public List<TeamVO> getTeamRankings() {
        log.info("get Team Rankings...");
        return mapper.getTeamRank();
    }

    @Override
    public List<BatterVO> getBatterRankings() {
        log.info("get Batter Rankings...");
        return mapper.getBatterRank();
    }

    @Override
    public List<PitcherVO> getPitcherRankings() {
        log.info("get Pitcher Rankings...");
        return mapper.getPitcherRank();
    }
    
    // 🌟 이 메서드는 클래스 레벨에서 독립적으로 정의되어야 합니다.
    @Override
    public List<TeamVO> getAllTeams() {
        log.info("get All Teams for signup...");
        return mapper.getAllTeams();
    }
    
    // 🌟 이 메서드 역시 클래스 레벨에서 독립적으로 정의되어야 합니다.
    @Override
    public List<PlayerDTO> getAllPlayers() { 
        log.info("get All Players for signup...");
        return mapper.getAllPlayers();
    }
}