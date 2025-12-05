package org.mnu.service;

import java.util.List;
import org.mnu.domain.BoardVO;
import org.mnu.domain.Criteria;
import org.mnu.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // 트랜잭션 처리
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper mapper;

    @Override
    public void register(BoardVO board) {
        log.info("register......" + board);
        mapper.insert(board);
    }

    @Override
    public BoardVO get(Long bno) {
        log.info("get......" + bno);
        mapper.updateViewCnt(bno);
        return mapper.read(bno);
    }

    @Override
    public boolean modify(BoardVO board) {
        log.info("modify......" + board);
        return mapper.update(board) == 1;
    }

    @Override
    public boolean remove(Long bno) {
        log.info("remove......" + bno);
        return mapper.delete(bno) == 1;
    }

    @Override
    public List<BoardVO> getList(Criteria cri) {
        log.info("get List with criteria: " + cri);
        return mapper.getListWithPaging(cri);
    }

    // (참고) 만약 검색 기능을 제대로 쓰려면 인자에 Criteria cri를 넣어야 합니다.
    // 기존 코드 유지함
    @Override
    public int getTotal() {
        log.info("get total count");
        return mapper.getTotalCount(null);
    }

    // ★ [추가됨] 신고 기능 구현
    @Transactional // 신고 기록 저장과 카운트 증가를 한 번에 처리 (오류나면 롤백)
    @Override
    public boolean report(Long bno, String userId) {
        log.info("report service...... bno: " + bno + ", user: " + userId);

        // 1. 이미 신고했는지 DB에서 확인
        int count = mapper.checkReport(bno, userId);
        
        if (count > 0) {
            return false; // 이미 신고함 -> 실패 처리
        }

        // 2. 신고 안 했으면 -> 신고 기록 남기기
        mapper.addReportHistory(bno, userId);

        // 3. 게시글의 신고 횟수 +1 증가
        mapper.increaseReportCnt(bno);

        return true; // 신고 성공
    }

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
}