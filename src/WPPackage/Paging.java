package WPPackage;

public class Paging {
	//페이징 관련 변수
	private int totalCount = 0 ; //총 레코드 건수
	private int totalPage = 0 ; //전체 페이지 수
	
	private int pageNumber = 0 ; //보여줄 페이지 넘버(표현 가능한 페이지는 1부터 totalPage까지이다.)
	private int pageSize = 0 ; //한 페이지에 보여줄 건수
	private int beginRow = 0 ; //현재 페이지의 시작 행
	private int endRow = 0 ; //현재 페이지의 끝 행
	
	private int pageCount = 10 ; //보여줄 페이지 링크 수
	private int beginPage = 0 ; //페이징 처리 시작 페이지 번호
	private int endPage = 0 ; //페이징 처리 끝 페이지 번호
	
	private String url = "" ; //예시 ==>  http://localhost:8989/MyServlet/list.do
	private String pagingHtml = "";//하단의 숫자 페이지 링크
	private String pagingStatus = ""; //상단 우측의 현재 페이지 위치 표시

	public Paging(String _pageNumber, String _pageSize, int totalCount, String url) {		
		
		this.pageNumber = _pageNumber == null ? 1 : Integer.parseInt( _pageNumber ) ;
		this.pageSize = _pageSize == null ? 10 : Integer.parseInt( _pageSize ) ;
		this.totalCount = totalCount ;
		this.url = url ;
		
		beginRow = (pageNumber - 1 ) * pageSize + 1  ; //현재 페이지의 시작 행
		endRow = pageNumber * pageSize   ;
		
		totalPage = (int)(Math.ceil((double)totalCount / pageSize)) ;		
		beginPage = (pageNumber-1)/pageCount*pageCount  + 1 ;
		if( beginPage < 0 ){ beginPage = 1 ; }
		endPage = beginPage + pageCount - 1 ;
		if( endPage > totalPage ){ endPage = totalPage ; }
		
		pagingHtml = "<br>"+ getPagingHtml( url ); //페이징 문자열
		
		pagingStatus = "" + beginPage + "-" + 
			endPage + "[" +  pageNumber + "/" + totalPage + "]" ;
		
		DisplayInformation();
	}
	
	private void DisplayInformation() {
		/*
		System.out.println("총 레코드 건수 : " + totalCount + "\n");
		System.out.println("전체 페이지 수 : " + totalPage + "\n");
		System.out.println("보여줄 페이지 넘버 : " + pageNumber + "\n");
		System.out.println("한 페이지에 보여줄 건수 : " + pageSize + "\n");
		System.out.println("현재 페이지의 시작 행 : " + beginRow + "\n");
		System.out.println("현재 페이지의 끝 행 : " + endRow + "\n");
		System.out.println("보여줄 페이지 링크 수 : " + pageCount + "\n");
		System.out.println("페이징 처리 시작 페이지 번호 : " + beginPage + "\n");
		System.out.println("페이징 처리 끝 페이지 번호 : " + endPage + "\n");
		System.out.println("요청 URL : " + url + "\n");
		System.out.println("하단의 숫자 페이지 링크 : " + pagingHtml + "\n");
		System.out.println("상단 우측의 현재 페이지 위치 표시 : " + pagingStatus + "\n");
		*/	
	}

	private String getPagingHtml( String uri ){ //페이징 문자열을 만든다.
		String result = "" ;
		if ( pageNumber <= pageCount ) {//1부터 10페이지까지는 [맨처음]과 [이전]이 없다 
			result += "맨처음&nbsp;&nbsp;";
			result += "이전&nbsp;&nbsp;";			
		} else {
			result += "<a href='" + uri + "?pageNumber=" + 1 + 
				"&pageSize=" + pageSize + "'>맨처음</a>&nbsp;&nbsp;";
			
			result += "<a href='" + uri + "?pageNumber=" + (beginPage - 1) + 
				"&pageSize=" + pageSize + "'>이전</a>&nbsp;&nbsp;";
		}		
		//페이지 시작 번호 부터 ~ 끝 번호 까지 표시
		for (int i = beginPage ; i <= endPage ; i++) {
			if(i == pageNumber){ //현재 페이지이면 링크는 없고, 빨간색으로 표시
				result += "<font color='red'><b>" + i + "</b></font>&nbsp;";
			}else{
				result += "<a href='" + uri + "?pageNumber=" + i + 
					"&pageSize=" + pageSize + "'>" + i + "</a>&nbsp;";	
			}			
		}		
		//마지막에는 [다음]과 [맨끝]이 없다
		if ( pageNumber >= (totalPage / pageCount * pageCount + 1) ) {
			result += "다음&nbsp;&nbsp;";
			result += "맨 끝&nbsp;&nbsp;";	
		} else {			
			result += "<a href='" + uri + "?pageNumber=" + (endPage + 1) + 
				"&pageSize=" + pageSize + "'>다음</a>&nbsp;&nbsp;";
			
			result += "<a href='" + uri + "?pageNumber=" + totalPage + 
				"&pageSize=" + pageSize + "'>맨 끝</a>";
		}
		return result ;
	}
	
	public String getPagingHtml() {	return pagingHtml;}
	public int getPageNumber() {	return pageNumber;}
	public int getPageSize() {	return pageSize;}	
	public String getPagingStatus() {	return pagingStatus;}	
	public int getBeginRow() {	return beginRow;}
	public int getEndRow() {	return endRow;}
	/*
	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}
	
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public int getPageCount() {
		return pageCount;
	}
	public String getUri() {
		return uri;
	}
*/	
}