package wordplay;

public class Cipher {
	private int cipherKey;

	public Cipher(int k) {
		cipherKey = k%26;
	}
	
	public String cipherMessage(String readableText){
		readableText = readableText.toUpperCase();
		char[] encoding = readableText.toCharArray();
		for (int i =0; i<encoding.length;i++){
			if ((encoding[i] >=65) && (encoding[i]<=90))
			{
				encoding[i]+=cipherKey;
				while (encoding[i]>90)
					encoding[i]-=26;
				
			}
		}
		return String.valueOf(encoding);
	}
}
