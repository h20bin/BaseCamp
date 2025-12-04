package org.mnu.service;

import java.util.List;
import org.mnu.domain.BoardVO;
import org.mnu.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board);
	public BoardVO get(Long bno);
	public boolean modify(BoardVO board);
	public boolean remove(Long bno);
	public List<BoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri); // (참고: 기존 코드에 파라미터가 없었다면 cri를 넣어주는게 좋습니다)
	
	// ★ [추가됨] 게시글 신고 처리 메서드
	public boolean report(Long bno, String userId);
	int getTotal();
}