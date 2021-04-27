package site.semi.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import java.util.regex.Pattern;

//�����α׷� �ۼ��� �ʿ��� ����� �����ϴ� Ŭ����
public class Utility {
	//���ڿ��� ���޹޾� ��ȣȭ ó���Ͽ� ��ȯ�ϴ� �޼ҵ�
	public static String encrypt(String source) {
		//��ȣȭ�� ���ڿ��� �����ϱ� ���� ����
		String password="";
		try {
			//MessageDigest : ��ȣȭ ó�� ����� �����ϴ� Ŭ����
			//MessageDigest.getInstance(String algorithm) : ��ȣȭ �˰������� ����� 
			//MessageDigest �ν��Ͻ��� ��ȯ�ϴ� �޼ҵ�
			// => NoSuchAlgorithmException �߻� - ����ó��
			//��ȣȭ �˰�����(�ܹ���) : MD5, SHA-1, SHA-256(����), SHA-512 ��
			MessageDigest md=MessageDigest.getInstance("SHA-256");
			
			//MessageDigest.update(byte[] input) : MessageDigest �ν��Ͻ��� ��ȣȭ ó���ϱ�
			//���� ���ڿ��� byte �迭�� ���޹޾� �����ϴ� �޼ҵ�
			//String.getBytes() : ���ڿ��� byte �迭�� ��ȯ�Ͽ� ��ȯ�ϴ� �޼ҵ�
			md.update(source.getBytes());
			
			//MessageDigest.digest() : MessageDigest �ν��Ͻ��� ����� byte �迭�� ��Ұ��� 
			//��ȣȭ �˰������� �̿��Ͽ� ��ȣȭ ó���Ͽ� byte �迭�� ��ȯ�ϴ� �޼ҵ�
			byte[] digest=md.digest();
			
			//��ȣȭ ó���� byte �迭�� 16���� ������ ���ڿ��� ��ȯ�Ͽ� ��ȣȭ ���� ������ �߰�
			for(int i=0;i<digest.length;i++) {
				password+=Integer.toHexString(digest[i] & 0xff);
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("[����]�߸��� ��ȣȭ �˰������� ��� �Ͽ����ϴ�.");
		}
		return password;
	}
	
	//���ڿ��� ���޹޾� �±� ���� ���ڿ��� ��� �����Ͽ� ��ȯ�ϴ� �޼ҵ�
	public static String stripTag(String source) {
		//Pattern : ����ǥ������ �����ϱ� ���� Ŭ����
		//Pattern.compile(String regEx) : ���ڿ��� ���޹޾� ����ǥ�������� ��ȯ�ϴ� ������
		//Pattern �ν��Ͻ��� ��ȯ�ϴ� �޼ҵ�
		//Pattern.CASE_INSENSITIVE : ����ǥ���Ŀ��� ��ҹ��ڸ� �������� �ʵ��� �����ϴ� ����ʵ�
		Pattern htmlTag=Pattern.compile("\\<.*?\\>",Pattern.CASE_INSENSITIVE);
		
		//Pattern.matcher(String source) : ����ǥ���İ� �Ű������� ���ް��� �� ó���ϱ� ����
		//Matcher �ν��Ͻ��� ��ȯ�ϴ� �޼ҵ�
		//Matcher.replaceAll(String replacement) : ����ǥ���İ� ������ ������ ���ڿ��� ã��
		//���ϴ� ���ڿ��� �����Ͽ� ��ȯ�ϴ� �޼ҵ�
		source=htmlTag.matcher(source).replaceAll("");//�±� ���� ���ڿ� ����
		
		return source;
	}
	//���ڿ��� ���޹޾� �±� ���� ��ȣ�� ȸ�ǹ��ڷ� ��ȯ�Ͽ� ��ȯ�ϴ� �޼ҵ�
	public static String escapeTag(String source) {
		return source.replace("<", "&lt;").replace(">", "&gt;");
	}	


	public static String tempPasswd() {
		//UUID : ���������� ���Ǵ� �������� �����ϱ� ���� Ŭ����
		//UUID.randomUUID() : �������� ����� UUID �ν��Ͻ��� ��ȯ�ϴ� �޼ҵ�
		// => ������ : ���ڿ� ���ĺ�(�ҹ���),-(4��)�� 36�� ���ڵ�� ������ ���ڿ�
			//UUID.toString() : UUID �ν��Ͻ��� ����� �������� ���ڿ��� ��ȯ�ϴ� �޼ҵ�
		return UUID.randomUUID().toString().replace("-", "").substring(0, 10).toUpperCase();
	}
		


	
	
}







