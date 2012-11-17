package WPPackage;

import java.text.DecimalFormat;

/*
 * 데이터베이스의 필요한 컬럼
 * 	groupno number not null,	
	rlevel varchar2(6) default '999999',
	
	테이블을 조회하고자 하는 경우 다음과 같이 수행	
	from guestbook order by groupno desc, rlevel desc))
 * 
 * 외부에서 페이징 처리하기 위한 절차
 * 그룹 번호와 순서 번호를 생성자의 매개 변수로 입력한다.
 * 구해진 객체를 이용하여 selectLastSequenceNumber 메소드를 호출한다.
 * selectLastSequenceNumber 메소드는 DAO 쪽에 존재해야 한다.
 * ReplyInfo 클래스의 객체에 getSequenceNumber 메소드를 이용하여 새로운 번호를 구한다.
 * 
			ReplyInfo reply = new ReplyInfo(bean.getGroupno(), bean.getRlevel());			
			String newRlevel = null ;
			newRlevel = selectLastSequenceNumber(reply);			
			//System.out.println( "newRlevel : " + newRlevel );
			
			String xxx =  reply.getSequenceNumber(newRlevel) ;
			System.out.println( "xxx : " + xxx ); 
*/

public class ReplyInfo {
	private int groupno ;//그룹 번호
	private String orderNo ;//순서 번호를 나타내는 문자열
	private int level ; //999999는 레벨이 0, 989999는 레벨이 1	
	private String searchMaxSeqNum = ""; //해당 레벨에서 가장 큰 순서 번호
	private String searchMinSeqNum = ""; //해당 레벨에서 가장 작은 순서 번호
	
	private static String BASIC_FORMAT = "000000"; //기본 포맷팅 문자열
	
	public ReplyInfo(int groupno, String orderNo) {
		this.groupno = groupno ;
		this.orderNo = orderNo ;
		
		this.level = this.getDepth(orderNo) ;
		this.searchMaxSeqNum = orderNo ;
		this.searchMinSeqNum = get_SearchMinSeqNum();
		
		printMe();
	}	
	public int getGroupno() {
		return groupno;
	}
	public String getSearchMinSeqNum() {
		return searchMinSeqNum;
	}
	public String getSearchMaxSeqNum() {
		return searchMaxSeqNum;
	}
	private void printMe() { //데이터가 잘 들어오는지 프린트해본다.	
		System.out.println( "---ReplyInfo 프린트 시작 ---" );
		System.out.println( "groupno : " + groupno );
		System.out.println( "orderNo : " + orderNo );
		System.out.println( "level : " + level );
		System.out.println( "searchMaxSeqNum : " + searchMaxSeqNum );
		System.out.println( "searchMinSeqNum : " + searchMinSeqNum );
		System.out.println( "---ReplyInfo 프린트 끝 ---" );
	}
	private String get_SearchMinSeqNum() {
		//해당 레벨에서 가장 낮은 순서 번호를 리턴한다.
		DecimalFormat decimalFormat = 
			new DecimalFormat( BASIC_FORMAT );
		long parentSeqLongValue = Long.parseLong(orderNo);
		long searchMinLongValue = 0;
		switch ( level ) {
		case 0:
			searchMinLongValue = parentSeqLongValue / 1000000L * 1000000L;
			break;
		case 1:
			searchMinLongValue = parentSeqLongValue / 10000L * 10000L;
			break;
		case 2:
			searchMinLongValue = parentSeqLongValue / 100L * 100L;
			break;
		}
		return decimalFormat.format(searchMinLongValue);
	}	
	private int getDepth( String Rlevel ) {
		if (Rlevel == null || Rlevel.length() != BASIC_FORMAT.length() ) {
			return -1;
		}
		if (Rlevel.endsWith("999999")) {
			return 0;
		}
		if (Rlevel.endsWith("9999")) {
			return 1;
		}
		if (Rlevel.endsWith("99")) {
			return 2;
		}
		return 3;
	}
	public String getSequenceNumber( String lastChildSeq ) throws Exception {
		//새롭게 인서트할 순서 번호를 구하여 리턴한다.
		int parentSeqLong = Integer.parseInt(this.orderNo);
		
		int decUnit = 0;
		if (level == 0) {
			decUnit = 10000;
		} else if (level == 1) {
			decUnit = 100; 
		} else if (level == 2) {
			decUnit = 1;
		}
		
		String sequenceNumber = null;
		
		DecimalFormat decimalFormat = 
			new DecimalFormat( BASIC_FORMAT );
		if (lastChildSeq == null) { // 답변 글이 없음
			sequenceNumber = decimalFormat.format(parentSeqLong - decUnit);
		} else { // 답변 글이 있음			
			
			String orderOfLastChildSeq = null; // 마지막 답변 글인지 확인
			
			if (level == 0) { // 999999 인 경우
				orderOfLastChildSeq = lastChildSeq.substring(0, 2);
				sequenceNumber = lastChildSeq.substring(0, 2) + "9999";
			} else if (level == 1) { // 989899 인 경우
				orderOfLastChildSeq = lastChildSeq.substring(2, 4);
				sequenceNumber = lastChildSeq.substring(0, 4) + "99";
			} else if (level == 2) {
				orderOfLastChildSeq = lastChildSeq.substring(4, 6);
				sequenceNumber = lastChildSeq;
			}
			if (orderOfLastChildSeq.equals("00")) {
				throw new Exception(
						"마지막 자식 글이 이미 존재합니다:" + lastChildSeq);
			}
			
			int seq = Integer.parseInt(sequenceNumber) - decUnit;
			//6자리의 숫자형 포맷으로 변환한다.
			sequenceNumber = decimalFormat.format(seq);
		}
		return sequenceNumber;
	}	
}