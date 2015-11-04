package wordplay;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.*;

public class PigLatin4 {
	private String message;
	private ArrayList<PLObject> messageWords;
	private Pattern p1;
	private Matcher m1;
	private String regex;
	
	public static void main(String[] args) {
		PigLatin4 translator = new PigLatin4();
		translator.setMessage(translator.getUserString());
		translator.getWords();
		System.out.println(translator.compileTranslation());

	
	}
	
	public String compileTranslation() {
		int start = 1;
		m1.reset();
		StringBuilder buildPig = new StringBuilder();
		for (int i = 0; i < messageWords.size(); i++) {
			m1.find(start - 1);

				buildPig.append(getMessage().substring(start - 1, m1.start() + messageWords.get(i).frontTrim));
				buildPig.append(messageWords.get(i).piggifiedWord);
			
			if ((i == messageWords.size() - 1) && (messageWords.get(i).groupNum<7))			//if last word and word did not end message, append final portion of message
				buildPig.append(getMessage().substring(m1.end() - 1));
			
			start = m1.end();
		}

		return buildPig.toString();
	}

	public void getWords() {
		regex = "(([^A-Za-z']([A-Za-z']+?)[^A-Za-z'])|(^([A-Za-z']+?)[^A-Za-z'])|([^A-Za-z']([A-Za-z']+?)$)|(^([A-Za-z']+?)$))"; //finds words containing apostrophes
		p1 = Pattern.compile(regex);
		m1 = p1.matcher(getMessage());
		int start = 1;
	
		
		messageWords = new ArrayList<>();
		while (m1.find(start - 1)) {		
			int groupNum=0;
			if (m1.group(3) != null)
				groupNum = 3;
			else if (m1.group(5) != null)
				groupNum = 5;
			else if (m1.group(7) != null)
				groupNum = 7;
			else if (m1.group(9)!= null)
				groupNum=9;
			
			start = m1.end();
		messageWords.add(new PLObject(m1.group(groupNum), groupNum));
	}
	}

	private class PLObject{
		String word;
		String piggifiedWord;
		int groupNum;
		int frontTrim;
		private PLObject(String word,  int groupNum) {
			this.word = word;
			this.groupNum = groupNum;
			piggifiedWord = PigLatin4.piggify(word);
			if ((groupNum ==3)||(groupNum==7)){
				frontTrim =1;
			}
		}
	}

	private String getUserString() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Welcome to the Pig Latin Translator");
		System.out.println("Please input a message that you would like to be translated: ");
		String s = scanner.nextLine();
		scanner.close();
		return s;
	}



	public static String piggify(String s) {
		Pattern p1 = Pattern.compile("^[aeiouAEIOU]");
		Matcher m1 = p1.matcher(s);
		Pattern p2 = Pattern.compile("(^.+?)[aeiouy]");
		Matcher m2 = p2.matcher(s);
		Pattern p3 = Pattern.compile("(^[^aeiouAEIOU ]*?[qQ][uU])[aeiouy]");
		Matcher m3 = p3.matcher(s);
		if (m1.find())															//executes if word starts with vowel
			return s + "-ay";
		if (m3.find()) {
			if (((int) s.charAt(0)) < 91) {
				s = s.substring(m3.end() - 1) + "-" +m3.group(1).toLowerCase() + "ay";	//executes if word starts with Q
				s = s.substring(0, 1).toUpperCase() + s.substring(1);
				return s;
			} else {
				return s.substring(m3.end() - 1) + "-"+ m3.group(1) + "ay";		//executes if word starts with q
			}
		}
		if (m2.find()) {
			if (((int) s.charAt(0)) < 91) {									//executes if word starts with Capital consonant
				s = s.substring(m2.end() - 1) + "-"+ m2.group(1).toLowerCase() + "ay";
				s = s.substring(0, 1).toUpperCase() + s.substring(1);
				return s;
			} else if (s.length() > 1)										//executes if word starts with lowercase consonant
				return s.substring(m2.end() - 1) + "-"+ m2.group(1) + "ay";
			
		}
		return s;															//Code should never be reached

	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
