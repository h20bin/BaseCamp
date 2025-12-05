package org.mnu.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mnu.domain.BoardVO;
import org.mnu.domain.Criteria;

public interface BoardMapper {

    // ★ [수정됨] Criteria cri 파라미터가 없으면 페이징/검색/카테고리 처리가 안됩니다.
    public List<BoardVO> getListWithPaging(Criteria cri);

    // ★ [수정됨] 여기도 반드시 (Criteria cri)가 있어야 카테고리별 개수를 셀 수 있습니다.
    public int getTotalCount(Criteria cri);

    public void insert(BoardVO board);

    // ★ [추가됨] XML에는 있는데 여기 없으면 에러 날 수 있음
    public void insertSelectKey(BoardVO board);

    public BoardVO read(Long bno);
    
    public int delete(Long bno);
    
    public int update(BoardVO board);

    public void updateViewCnt(Long bno);

    // 신고 기능
    public int checkReport(@Param("bno") Long bno, @Param("userId") String userId);
    public void addReportHistory(@Param("bno") Long bno, @Param("userId") String userId);
    public void increaseReportCnt(Long bno);
}