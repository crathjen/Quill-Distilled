package wordplay;

public class Decipher {
	private int cipherKey;

	public Decipher(int k) {
		cipherKey = k%26;
	}

	public String decipherMessage(String readableText) {
		readableText = readableText.toUpperCase();
		char[] encoding = readableText.toCharArray();
		for (int i = 0; i < encoding.length; i++) {
			if ((encoding[i] >= 65) && (encoding[i] <= 90)) {
				encoding[i] -= cipherKey;
				while (encoding[i] < 65)
					encoding[i] += 26;

			}
		}
		return String.valueOf(encoding);

	}
}