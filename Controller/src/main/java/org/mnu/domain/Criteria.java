package org.mnu.domain;

public class Criteria {

    private int page;
    private int perPageNum;

    private String keyword;     
    private String[] typeArr;   

    public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }

    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
            return;
        }
        this.page = page;
    }

    // ▼▼▼ MyBatis에서 pageNum을 요구하므로 추가됨
    public void setPageNum(int pageNum) {
        this.setPage(pageNum);  
    }

    public int getPage() {
        return page;
    }

    // ▼▼▼ MyBatis에서 pageNum 사용함 → getter 추가
    public int getPageNum() {
        return this.page;
    }

    public void setPerPageNum(int perPageNum) {
        if (perPageNum <= 0 || perPageNum > 100) {
            this.perPageNum = 10;
            return;
        }
        this.perPageNum = perPageNum;
    }

    public int getPerPageNum() {
        return perPageNum;
    }

    // MyBatis에서 사용될 페이징 시작 번호
    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String[] getTypeArr() {
        return typeArr;
    }

    public void setTypeArr(String[] typeArr) {
        this.typeArr = typeArr;
    }
}
