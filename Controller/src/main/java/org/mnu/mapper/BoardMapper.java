package org.mnu.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param; // ★ 이거 꼭 있어야 합니다!
import org.mnu.domain.BoardVO;
import org.mnu.domain.Criteria;

public interface BoardMapper {

    public List<BoardVO> getListWithPaging(Criteria cri);

    public int getTotalCount();
    public void insert(BoardVO board);
    public BoardVO read(Long bno);
    public int delete(Long bno);
    public int update(BoardVO board);

    public void updateViewCnt(Long bno);

    // ★ [추가됨] 신고 기능 관련 메서드 3개
    // 1. 중복 신고 체크 (누가 어느 글을 신고했는지)
    public int checkReport(@Param("bno") Long bno, @Param("userId") String userId);

    // 2. 신고 기록 저장
    public void addReportHistory(@Param("bno") Long bno, @Param("userId") String userId);

    // 3. 게시글의 신고 횟수 증가
    public void increaseReportCnt(Long bno);
}