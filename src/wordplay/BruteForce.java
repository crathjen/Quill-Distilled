package wordplay;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;



public class BruteForce implements Runnable {
//	Thread t;
	String message;
	int key;
	static Map<Integer, String> map; 
	
	BruteForce(String message, int key){
		this.message=message;
		this.key = key;
		//t= new Thread(this);
	}
//	public void startThread(){
//		t.start();
//	}
	public void run(){
		Decipher d = new Decipher(key);
		message=d.decipherMessage(message);
		synchronized (map){
			map.put(key, message);
		}
		//System.out.println(key+ ": "+message);
	}
	
	public static String main(String s) throws Exception{
		ExecutorService ex = Executors.newFixedThreadPool(26);
		map = new HashMap<Integer,String>();
		WordChecker.loadFile();
//		Scanner scanner = new Scanner(System.in);
//		System.out.println("Please enter the message you want hacked: ");
//		String codedMessage = scanner.nextLine();
//		scanner.close();
		String codedMessage=s;
		for (int i=1;i<=26;i++){
			ex.execute(new BruteForce(codedMessage, i));
		}
		while(map.size()<26);
		
		CountDownLatch latch= new CountDownLatch(26);
		for (int i=1;i<=26;i++){
			ex.execute(new WordChecker(map.get(i), i, latch));
		}
		latch.await();
		ex.shutdown();
		ArrayList<Integer> winnerKeys= WordChecker.winnerIs();
		
		if (winnerKeys.size()==1);
			//System.out.println(map.get(winnerKeys.get(0)));
		else {
			System.out.println("The hacking was ambiguous, but we have narrowed down the message to one of the following: ");
			for(int i :winnerKeys){
				System.out.println(map.get(i));
			}
		}
		return map.get(winnerKeys.get(0));
		
	
	}
	
	

}
