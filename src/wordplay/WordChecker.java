package wordplay;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.CountDownLatch;

public class WordChecker implements Runnable {
	static ArrayList<String> dictionary;
	static HashMap<Integer, Integer> map=new HashMap();
	String message;
	int key;
	int numWords = 0;
	String[] words;
	CountDownLatch latch;

//	static {
//		loadFile();
//	}

	WordChecker(String message, int key, CountDownLatch latch) {
		this.message = message;
		this.key=key;
		this.latch=latch;
		words = message.split(" ");
	}

	static void loadFile() {
		dictionary = new ArrayList<String>();
		URL url = WordChecker.class.getResource("wordsLong.txt");
		System.out.println(url.getPath());
		try (BufferedReader buf = new BufferedReader(new FileReader(url.getPath()))) {
			String line;
			while ((line = buf.readLine()) != null) {
				dictionary.add(line.toUpperCase().trim());
			}
		} catch (IOException e) {
			System.out.println(e);
		}
		System.out.println(dictionary.size());
	}

	public static ArrayList<Integer> winnerIs(){
		int winKey=1;
		int maxwords=-1;
		ArrayList<Integer> winnerKeys = new ArrayList<>();
		for(int i: map.keySet()){
			if (map.get(i)>maxwords){
				winKey=i;
				maxwords=map.get(i);
			}
		}
		for(int i: map.keySet()){
			if (map.get(i)==maxwords)
				winnerKeys.add(i);
		}
		//System.out.println(map);
		return winnerKeys;
	}
	
	public void run() {
		int lb = 0, ub = dictionary.size()-1, compare, wordsEvaluated=0;
		for (String w : words) {
			if( wordsEvaluated>10 && numWords<wordsEvaluated/2){
				break;
			}
			if(wordsEvaluated>50 && latch.getCount()==1)
				break;
			lb=0; ub = dictionary.size()-1; 
			wordsEvaluated++;
			//System.out.println(w);
			while (true) {
				compare = w.compareTo(dictionary.get((ub + lb) / 2));
				if (compare > 0)
					lb = (ub + lb) / 2;
				else if (compare < 0)
					ub = (ub + lb) / 2;
				else if (compare == 0) {
					numWords++;
					//System.out.println(w);
					break;
				}
				if (ub - lb <= 1)
					if ((w.compareTo(dictionary.get(ub)) == 0) ||(w.compareTo(dictionary.get(lb))==0)){
						numWords++;
						//System.out.println(w);
						break;
					}
					else break;
			}

		}
	
		synchronized (map){
			map.put(key, numWords);
		}
		latch.countDown();
	}
}
