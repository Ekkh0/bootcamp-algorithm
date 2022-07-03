package assignment4;

import java.util.ArrayList;
import java.util.Scanner;

public class App {
	
	Scanner sc=new Scanner(System.in);
	Validation validate=new Validation();
	ArrayList<Runner> runners=new ArrayList<>();
	
	int turtleScore=0;
	int hareScore=0;
	
	void addRunner() {
		String name=null;
		String type=null;
		
		do {
			System.out.print("Type: ");
			type=sc.nextLine();
		}while(!validate.isValidType(type));
		
		do {
			System.out.print("Name: ");
			name=sc.nextLine();
		}while(!validate.isValidName(name));

		if(type.contentEquals("hare")) {
			runners.add(new Hare(name, type));
		}else{
			runners.add(new Turtle(name, type));
		}

		System.out.println("Another runner has joined the race!");
	}
	
	void joinRun() {
		Leaderboard board=new Leaderboard(runners);
		
		while(board.isRunning) {
			board.updateBoard();
			board.showBoard();
		}
		
		if(board.winner instanceof Hare) {
			hareScore++;
		}else {
			turtleScore++;
		}
		
		board.resetBoard();
	}

	void viewStanding() {
		if(hareScore==turtleScore) {
			System.out.println("Draw");
		}else if(hareScore>turtleScore) {
			System.out.println("Hare Wins!");
		}else if(hareScore<turtleScore) {
			System.out.println("Turtle Wins!");
		}
		System.out.println("Turtle wins: "+turtleScore);
		System.out.println("Hare wins: "+hareScore);
	}
	
	public App(boolean onApp) {
		while(onApp) {
			int choice=-1;
			System.out.println("1. Add Runner");
			System.out.println("2. Join Run");
			System.out.println("3. View Standing");
			System.out.println("4. Close Program");
			
			do {
				System.out.print(">> ");
				choice=sc.nextInt();sc.nextLine();
			}while(!validate.isValidChoice(choice));
			
			switch(choice) {
			case 1:
				addRunner();
				break;
			case 2:
				joinRun();
				break;
			case 3:
				viewStanding();
				break;
			case 4:
				onApp=false;
				break;
			}
			
		}
	}

	public static void main(String[] args) {
		new App(true);
	}

}
