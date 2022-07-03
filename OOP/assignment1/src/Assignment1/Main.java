package Assignment1;

import java.util.Scanner;

public class Main {

	public Main() {
		System.out.println(" ____     _____            _____  ____    ______          __       ___             \r\n" + 
				"/\\  _`\\  /\\___ \\          /\\___ \\/\\  _`\\ /\\__  _\\        /\\ \\     /\\_ \\            \r\n" + 
				"\\ \\ \\L\\ \\\\/__/\\ \\         \\/__/\\ \\ \\ \\L\\ \\/_/\\ \\/    __  \\ \\ \\____\\//\\ \\      __   \r\n" + 
				" \\ \\  _ <'  _\\ \\ \\  _______  _\\ \\ \\ \\ ,__/  \\ \\ \\  /'__`\\ \\ \\ '__`\\ \\ \\ \\   /'__`\\ \r\n" + 
				"  \\ \\ \\L\\ \\/\\ \\_\\ \\/\\______\\/\\ \\_\\ \\ \\ \\/    \\ \\ \\/\\ \\L\\.\\_\\ \\ \\L\\ \\ \\_\\ \\_/\\  __/ \r\n" + 
				"   \\ \\____/\\ \\____/\\/______/\\ \\____/\\ \\_\\     \\ \\_\\ \\__/.\\_\\\\ \\_,__/ /\\____\\ \\____\\\r\n" + 
				"    \\/___/  \\/___/           \\/___/  \\/_/      \\/_/\\/__/\\/_/ \\/___/  \\/____/\\/____/\r\n" + 
				"                                                                                   \r\n" + 
				"                                                                                   ");
		int choice=0;
		Scanner scan=new Scanner(System.in);
		while(choice!=2) {
			System.out.println("1. Start The Simulation!!\n2. Close App\n>>>");
			choice=scan.nextInt();
			if(choice==1) {
				int firstnum, secondnum;
				do {
					System.out.println("Input the first number [1 - 100](inclusive):");
					firstnum=scan.nextInt();
				}while(firstnum<1||firstnum>100);
				do {
					System.out.println("Input the second number [1 - 100](inclusive):");
					secondnum=scan.nextInt();
				}while(secondnum<1||secondnum>100);
				System.out.println("+========================================================================================================================+");
				System.out.println("+  + (String type)  |  (Character Type  |  * (Integer type)  |  / (Floating Type)  |  input 1 == input 2 (Boolean Type)  +");
				System.out.println("+========================================================================================================================+");
				System.out.printf("+%8d + %-8d|%8c   %-8c|%12d        |%13.3f        |%21s                +\n",firstnum, secondnum, firstnum, secondnum, firstnum*secondnum, (float)firstnum/secondnum, firstnum==secondnum ? "true":"false");
				System.out.println("+========================================================================================================================+");
				System.out.println("Enter to continue...");
				System.out.printf("%d %d %d %d\n", firstnum+secondnum, firstnum-secondnum, firstnum*secondnum, firstnum/secondnum, firstnum%secondnum);
				Boolean p1, p2;
				do {
					System.out.printf("Give me value for p1[true | false]: ");
					p1=scan.nextBoolean();
				}while(p1==null);
				do {
					System.out.printf("Give me value for p2[true | false]: ");
					p2=scan.nextBoolean();
				}while(p2==null);
				System.out.println(!p1);
				System.out.println(!p2);
				System.out.println(p1&&p2);
				System.out.println(p1||p2);
			}
		}
		System.out.println("thank you for using the apps!!\n");
		scan.close();
	}

	public static void main(String[] args) {
		new Main();

	}

}
