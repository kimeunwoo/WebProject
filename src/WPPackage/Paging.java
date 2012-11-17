package WPPackage;

public class Paging {
	//����¡ ���� ����
	private int totalCount = 0 ; //�� ���ڵ� �Ǽ�
	private int totalPage = 0 ; //��ü ������ ��
	
	private int pageNumber = 0 ; //������ ������ �ѹ�(ǥ�� ������ �������� 1���� totalPage�����̴�.)
	private int pageSize = 0 ; //�� �������� ������ �Ǽ�
	private int beginRow = 0 ; //���� �������� ���� ��
	private int endRow = 0 ; //���� �������� �� ��
	
	private int pageCount = 10 ; //������ ������ ��ũ ��
	private int beginPage = 0 ; //����¡ ó�� ���� ������ ��ȣ
	private int endPage = 0 ; //����¡ ó�� �� ������ ��ȣ
	
	private String url = "" ; //���� ==>  http://localhost:8989/MyServlet/list.do
	private String pagingHtml = "";//�ϴ��� ���� ������ ��ũ
	private String pagingStatus = ""; //��� ������ ���� ������ ��ġ ǥ��

	public Paging(String _pageNumber, String _pageSize, int totalCount, String url) {		
		
		this.pageNumber = _pageNumber == null ? 1 : Integer.parseInt( _pageNumber ) ;
		this.pageSize = _pageSize == null ? 10 : Integer.parseInt( _pageSize ) ;
		this.totalCount = totalCount ;
		this.url = url ;
		
		beginRow = (pageNumber - 1 ) * pageSize + 1  ; //���� �������� ���� ��
		endRow = pageNumber * pageSize   ;
		
		totalPage = (int)(Math.ceil((double)totalCount / pageSize)) ;		
		beginPage = (pageNumber-1)/pageCount*pageCount  + 1 ;
		if( beginPage < 0 ){ beginPage = 1 ; }
		endPage = beginPage + pageCount - 1 ;
		if( endPage > totalPage ){ endPage = totalPage ; }
		
		pagingHtml = "<br>"+ getPagingHtml( url ); //����¡ ���ڿ�
		
		pagingStatus = "" + beginPage + "-" + 
			endPage + "[" +  pageNumber + "/" + totalPage + "]" ;
		
		DisplayInformation();
	}
	
	private void DisplayInformation() {
		/*
		System.out.println("�� ���ڵ� �Ǽ� : " + totalCount + "\n");
		System.out.println("��ü ������ �� : " + totalPage + "\n");
		System.out.println("������ ������ �ѹ� : " + pageNumber + "\n");
		System.out.println("�� �������� ������ �Ǽ� : " + pageSize + "\n");
		System.out.println("���� �������� ���� �� : " + beginRow + "\n");
		System.out.println("���� �������� �� �� : " + endRow + "\n");
		System.out.println("������ ������ ��ũ �� : " + pageCount + "\n");
		System.out.println("����¡ ó�� ���� ������ ��ȣ : " + beginPage + "\n");
		System.out.println("����¡ ó�� �� ������ ��ȣ : " + endPage + "\n");
		System.out.println("��û URL : " + url + "\n");
		System.out.println("�ϴ��� ���� ������ ��ũ : " + pagingHtml + "\n");
		System.out.println("��� ������ ���� ������ ��ġ ǥ�� : " + pagingStatus + "\n");
		*/	
	}

	private String getPagingHtml( String uri ){ //����¡ ���ڿ��� �����.
		String result = "" ;
		if ( pageNumber <= pageCount ) {//1���� 10������������ [��ó��]�� [����]�� ���� 
			result += "��ó��&nbsp;&nbsp;";
			result += "����&nbsp;&nbsp;";			
		} else {
			result += "<a href='" + uri + "?pageNumber=" + 1 + 
				"&pageSize=" + pageSize + "'>��ó��</a>&nbsp;&nbsp;";
			
			result += "<a href='" + uri + "?pageNumber=" + (beginPage - 1) + 
				"&pageSize=" + pageSize + "'>����</a>&nbsp;&nbsp;";
		}		
		//������ ���� ��ȣ ���� ~ �� ��ȣ ���� ǥ��
		for (int i = beginPage ; i <= endPage ; i++) {
			if(i == pageNumber){ //���� �������̸� ��ũ�� ����, ���������� ǥ��
				result += "<font color='red'><b>" + i + "</b></font>&nbsp;";
			}else{
				result += "<a href='" + uri + "?pageNumber=" + i + 
					"&pageSize=" + pageSize + "'>" + i + "</a>&nbsp;";	
			}			
		}		
		//���������� [����]�� [�ǳ�]�� ����
		if ( pageNumber >= (totalPage / pageCount * pageCount + 1) ) {
			result += "����&nbsp;&nbsp;";
			result += "�� ��&nbsp;&nbsp;";	
		} else {			
			result += "<a href='" + uri + "?pageNumber=" + (endPage + 1) + 
				"&pageSize=" + pageSize + "'>����</a>&nbsp;&nbsp;";
			
			result += "<a href='" + uri + "?pageNumber=" + totalPage + 
				"&pageSize=" + pageSize + "'>�� ��</a>";
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