package org.mnu.controller;

import org.mnu.service.RecordService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/record/*")
@AllArgsConstructor
public class RecordController {

    private RecordService service;

    // 통합 페이지: /record/list 접속 시 모든 데이터를 가져와야 함
    @GetMapping("/list")
    public void recordList(Model model) {
        log.info("============== 통합 기록 페이지 진입 ==============");
        
        // 1. 팀 순위 가져오기
        model.addAttribute("teamList", service.getTeamRankings());
        log.info("팀 데이터 로딩 완료");

        // 2. 선수 전체 목록 가져오기 (타자+투수)
        model.addAttribute("playerList", service.getAllPlayers());
        log.info("선수 데이터 로딩 완료");

        // 3. 경기 기록 가져오기
        model.addAttribute("gameList", service.getGameList());
        log.info("경기 데이터 로딩 완료");
    }

    // (참고) 아래 메서드들은 개별 페이지 접속용이므로, 
    // /record/list 탭 화면에서는 사용되지 않지만 삭제할 필요는 없습니다.
    @GetMapping("/team")
    public void team(Model model) {
        model.addAttribute("teamList", service.getTeamRankings());
    }

    @GetMapping("/player")
    public void player(Model model) {
        // 개별 페이지에서는 batter/pitcher를 따로 보낼 수 있지만
        // 통합 페이지(list)에서는 playerList 하나로 합쳐서 처리하는 것이 편합니다.
        model.addAttribute("batterList", service.getBatterRankings());
        model.addAttribute("pitcherList", service.getPitcherRankings());
    }
}