package org.mnu.mapper;

import java.util.List;
import org.mnu.domain.ReplyVO;

public interface ReplyMapper {

    // 1. 댓글 등록
    public int insert(ReplyVO vo);

    // 2. 특정 댓글 읽기 (수정/삭제 시 필요)
    public ReplyVO read(Long rno);

    // 3. 댓글 삭제
    public int delete(Long rno);

    // 4. 댓글 수정
    public int update(ReplyVO reply);

    // 5. 댓글 목록 가져오기 (게시글 번호 bno에 달린 댓글들)
    public List<ReplyVO> getList(Long bno);
}