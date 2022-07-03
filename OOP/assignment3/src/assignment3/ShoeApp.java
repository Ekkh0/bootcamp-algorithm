package assignment3;

import java.util.ArrayList;
import java.util.Scanner;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ShoeApp {
	
	Scanner sc=new Scanner(System.in);
	ArrayList<Shoe> shoes=new ArrayList<>();
	
	public void deleteShoe(boolean isNotEmpty) {
		if(isNotEmpty) {
			int max=shoes.size();
			boolean isValidIndex=true;
			int index=-1;
			do {
				isValidIndex=true;
				System.out.printf("Please input the index you want to delete: ");
				index=sc.nextInt();sc.nextLine();
				if(index<1||index>max) {
					isValidIndex=false;
				}
			}while(!isValidIndex);
			shoes.remove(index-1);
			System.out.println("Successfully removed shoe!");
		}
	}
	
	public void enterToContinue() {
		System.out.println("Enter to Continue..");
		sc.nextLine();
	}
	
	public boolean viewShoes() {
		if(shoes.isEmpty()) {
			System.out.println("No shoes available..");
			enterToContinue();
			return false;
		}else {
			for(int i=0; i<shoes.size(); i++) {
				System.out.println((i+1)+". "+shoes.get(i).toString());
			}
			return true;
		}
	}
	
	public void addShoe() {
		String name=null;
		boolean isValidName=true;
		
		do {
			isValidName=true;
			System.out.print("Nama: ");
			name=sc.nextLine();
			isValidName=name.endsWith("shoe")?true:false;
		}while(!isValidName);
		
		String category=null;
		boolean isValidCategory=true;
		
		do {
			isValidCategory=true;
			System.out.print("Category: ");
			category=sc.nextLine();
			isValidCategory=(category.contentEquals("Sneaker") ||
							 category.contentEquals("Running") ||
							 category.contentEquals("Boot")) ? true:false;
		}while(!isValidCategory);
		
		String date=null;
		boolean isValidDate=true;
		
		do {
			isValidDate=true;
			System.out.print("Date: ");
			date=sc.nextLine();
			try {
				SimpleDateFormat sdf=new SimpleDateFormat("dd-mm-yyyy");
				sdf.setLenient(false);
				sdf.parse(date);
			}catch(ParseException pe) {
				isValidDate=false;
			}
		}while(!isValidDate);
		
		Integer price=-1;
		boolean isValidPrice=true;
		
		do {
			isValidPrice=true;
			System.out.print("Price: ");
			price=sc.nextInt();sc.nextLine();
			isValidPrice=(price>=5000)?true:false;
		}while(!isValidPrice);
		
		Shoe newShoe=new Shoe(name, category, date, price);
		shoes.add(newShoe);
		System.out.println("Shoe Added!");
		enterToContinue();
	}
	
	public ShoeApp(boolean onApp) {
		while(onApp) {
			System.out.println("Shoe Shop");
			System.out.println("1. View Shoes");
			System.out.println("2. Add Shoe");
			System.out.println("3. Delete Shoe");
			System.out.println("4. Exit");
			
			int choice=-1;
			boolean isValidChoice=true;
			
			do {
				isValidChoice=true;
				System.out.print(">> ");
				choice=sc.nextInt();sc.nextLine();
				if(choice<1||choice>4) {
					isValidChoice=false;
				}
			}while(!isValidChoice);
			
			switch(choice) {
			case 1:
				viewShoes();
				break;
			case 2:
				addShoe();
				break;
			case 3:
				deleteShoe(viewShoes());
				break;
			case 4:
				System.out.println("Thank you!");
				onApp=false;
				break;
			}
		}
	}

	public static void main(String[] args) {
		new ShoeApp(true);
	}
	
}
