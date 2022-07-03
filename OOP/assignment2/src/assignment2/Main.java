package assignment2;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
	
	ArrayList<Participant>participants=new ArrayList<>();
	Scanner sc=new Scanner(System.in);
	
	public void enterToContinue() {
		System.out.println("Enter to Continue..");
		sc.nextLine();
	}

	private Main() {
		System.out.println("  ____       _        _____ _    _          _____  ______ \r\n" + 
				" |  _ \\     | |      / ____| |  | |   /\\   |  __ \\|  ____|\r\n" + 
				" | |_) |    | |_____| (___ | |__| |  /  \\  | |__) | |__   \r\n" + 
				" |  _ < _   | |______\\___ \\|  __  | / /\\ \\ |  _  /|  __|  \r\n" + 
				" | |_) | |__| |      ____) | |  | |/ ____ \\| | \\ \\| |____ \r\n" + 
				" |____/ \\____/      |_____/|_|  |_/_/    \\_\\_|  \\_\\______|\r\n" + 
				"                                                          \r\n" + 
				"                                                          ");
		int choice=0;
		while(choice!=4) {
			System.out.println("1. Start Sharing\n2. Update Participant\n3. Delete Participant\n4. Close App");
			System.out.printf(">>");
			choice=sc.nextInt();sc.nextLine();
			String numberTest=null;
			Integer number = null;
			boolean numberIsValid=true;
			String Username=null;
			boolean UsernameIsValid=true;
			if(choice==1) {
				do {
					numberIsValid=false;
					System.out.print("Input a number[0 - 100]: ");
					numberTest=sc.nextLine();
					try {
						number = Integer.parseInt(numberTest);
						numberIsValid=number<0||number>100?true:false;
					}catch(NumberFormatException e) {
						System.out.println("input must be numeric");
						numberIsValid=true;
					}
				}while(numberIsValid);
				do {
					System.out.printf("Could you give me your username [5 - 20 characters]? ");
					Username=sc.nextLine();
					if(Username.length()>=5&&Username.length()<=20) {
						UsernameIsValid=false;
					}
					for(int i=0; i<participants.size(); i++) {
						if(Username.equals(participants.get(i).getUsername())) {
							UsernameIsValid=true;
							System.out.println("Username must be unique!");
						}
					}
				}while(UsernameIsValid);
				participants.add(new Participant(number, Username));
				enterToContinue();
			}else if(choice==2) {
				if(!participants.isEmpty()) {
					for(int i=0; i<participants.size(); i++) {
						System.out.println("| "+(i+1)+" | "+participants.get(i).getUsername()+" | "+participants.get(i).getNumber()+" |");
					}
					int max=participants.size();
					int indexnum;
					do {
						System.out.println("Which participant would you like to update [1 - "+max+"][0 to exit]?");
						indexnum=sc.nextInt();sc.nextLine();
					}while((indexnum<1||indexnum>max)&&indexnum!=0);
					if(indexnum==0) {
						System.out.println("Cancelled update!");
					}else {
						do {
							numberIsValid=false;
							System.out.print("Input a number[0 - 100]: ");
							numberTest=sc.nextLine();
							try {
								number = Integer.parseInt(numberTest);
								numberIsValid=number<0||number>100?true:false;
							}catch(NumberFormatException e) {
								System.out.println("input must be numeric");
								numberIsValid=true;
							}
						}while(numberIsValid);
						do {
							System.out.printf("Could you give me your username [5 - 20 characters]? ");
							Username=sc.nextLine();
							if(Username.length()>=5&&Username.length()<=20) {
								UsernameIsValid=false;
							}
							for(int i=0; i<participants.size(); i++) {
								if(Username.equals(participants.get(i).getUsername())) {
									UsernameIsValid=true;
									System.out.println("Username must be unique!");
								}
							}
						}while(UsernameIsValid);
						participants.get(indexnum-1).setNumber(number);
						participants.get(indexnum-1).setUsername(Username);
						System.out.println("Update successful");
					}
				}else {
					System.out.println("The list is empty!");
				}
				enterToContinue();
			}else if(choice==3) {
				if(!participants.isEmpty()) {
					for(int i=0; i<participants.size(); i++) {
						System.out.println("| "+(i+1)+" | "+participants.get(i).getUsername()+" | "+participants.get(i).getNumber()+" |");
					}
					int max=participants.size();
					int indexnum;
					do {
						System.out.println("Which participant would you like to delete [1 - "+max+"][0 to exit]?");
						indexnum=sc.nextInt();sc.nextLine();
					}while((indexnum<1||indexnum>max)&&indexnum!=0);
					if(indexnum==0) {
						System.out.println("Cancelled delete!");
					}else {
						participants.remove(indexnum-1);
						System.out.println("Deletion Successful!");
					}
				}else {
					System.out.println("The list is empty!");
				}
				enterToContinue();
			}
		}
	}

	public static void main(String[] args) {
		new Main();
	}

}
