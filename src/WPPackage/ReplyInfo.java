package WPPackage;

import java.text.DecimalFormat;

/*
 * �����ͺ��̽��� �ʿ��� �÷�
 * 	groupno number not null,	
	rlevel varchar2(6) default '999999',
	
	���̺��� ��ȸ�ϰ��� �ϴ� ��� ������ ���� ����	
	from guestbook order by groupno desc, rlevel desc))
 * 
 * �ܺο��� ����¡ ó���ϱ� ���� ����
 * �׷� ��ȣ�� ���� ��ȣ�� �������� �Ű� ������ �Է��Ѵ�.
 * ������ ��ü�� �̿��Ͽ� selectLastSequenceNumber �޼ҵ带 ȣ���Ѵ�.
 * selectLastSequenceNumber �޼ҵ�� DAO �ʿ� �����ؾ� �Ѵ�.
 * ReplyInfo Ŭ������ ��ü�� getSequenceNumber �޼ҵ带 �̿��Ͽ� ���ο� ��ȣ�� ���Ѵ�.
 * 
			ReplyInfo reply = new ReplyInfo(bean.getGroupno(), bean.getRlevel());			
			String newRlevel = null ;
			newRlevel = selectLastSequenceNumber(reply);			
			//System.out.println( "newRlevel : " + newRlevel );
			
			String xxx =  reply.getSequenceNumber(newRlevel) ;
			System.out.println( "xxx : " + xxx ); 
*/

public class ReplyInfo {
	private int groupno ;//�׷� ��ȣ
	private String orderNo ;//���� ��ȣ�� ��Ÿ���� ���ڿ�
	private int level ; //999999�� ������ 0, 989999�� ������ 1	
	private String searchMaxSeqNum = ""; //�ش� �������� ���� ū ���� ��ȣ
	private String searchMinSeqNum = ""; //�ش� �������� ���� ���� ���� ��ȣ
	
	private static String BASIC_FORMAT = "000000"; //�⺻ ������ ���ڿ�
	
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
	private void printMe() { //�����Ͱ� �� �������� ����Ʈ�غ���.	
		System.out.println( "---ReplyInfo ����Ʈ ���� ---" );
		System.out.println( "groupno : " + groupno );
		System.out.println( "orderNo : " + orderNo );
		System.out.println( "level : " + level );
		System.out.println( "searchMaxSeqNum : " + searchMaxSeqNum );
		System.out.println( "searchMinSeqNum : " + searchMinSeqNum );
		System.out.println( "---ReplyInfo ����Ʈ �� ---" );
	}
	private String get_SearchMinSeqNum() {
		//�ش� �������� ���� ���� ���� ��ȣ�� �����Ѵ�.
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
		//���Ӱ� �μ�Ʈ�� ���� ��ȣ�� ���Ͽ� �����Ѵ�.
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
		if (lastChildSeq == null) { // �亯 ���� ����
			sequenceNumber = decimalFormat.format(parentSeqLong - decUnit);
		} else { // �亯 ���� ����			
			
			String orderOfLastChildSeq = null; // ������ �亯 ������ Ȯ��
			
			if (level == 0) { // 999999 �� ���
				orderOfLastChildSeq = lastChildSeq.substring(0, 2);
				sequenceNumber = lastChildSeq.substring(0, 2) + "9999";
			} else if (level == 1) { // 989899 �� ���
				orderOfLastChildSeq = lastChildSeq.substring(2, 4);
				sequenceNumber = lastChildSeq.substring(0, 4) + "99";
			} else if (level == 2) {
				orderOfLastChildSeq = lastChildSeq.substring(4, 6);
				sequenceNumber = lastChildSeq;
			}
			if (orderOfLastChildSeq.equals("00")) {
				throw new Exception(
						"������ �ڽ� ���� �̹� �����մϴ�:" + lastChildSeq);
			}
			
			int seq = Integer.parseInt(sequenceNumber) - decUnit;
			//6�ڸ��� ������ �������� ��ȯ�Ѵ�.
			sequenceNumber = decimalFormat.format(seq);
		}
		return sequenceNumber;
	}	
}