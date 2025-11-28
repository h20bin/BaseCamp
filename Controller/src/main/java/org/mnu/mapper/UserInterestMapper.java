package org.mnu.mapper;

import org.apache.ibatis.annotations.Param;

public interface UserInterestMapper {
    /**
     * USER_INTERESTS 테이블에 관심 선수 정보를 삽입합니다.
     * @param userId 사용자 ID
     * @param playerId 선수 ID
     */
    // MyBatis에서 파라미터가 2개 이상일 때 @Param을 사용하는 것이 안전합니다.
    public void insertInterest(@Param("userId") String userId, @Param("playerId") String playerId);
}