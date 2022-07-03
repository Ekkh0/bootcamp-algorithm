package assignment3;

import java.util.concurrent.ThreadLocalRandom;

public class Shoe {

	private String ID;
	private String name;
	private String category;
	private String date;
	private Integer price;
	
	public String generateID() {
		String ID="SH";
		for(int i=0; i<3; i++) {
			Integer random=ThreadLocalRandom.current().nextInt(0,10);
			ID+=random.toString();
		}
		return ID;
	}
	
	public Shoe(String name, String category, String date, Integer price) {
		this.ID=generateID();
		this.name = name;
		this.category = category;
		this.date = date;
		this.price = price;
	}
	
	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String toString() {
		String result="";
		result+=this.name+"-"+this.ID+"\n";
		result+="=====================\n";
		result+="Category: "+this.category+"\n";
		result+="Release date: "+this.date+"\n";
		result+="Price: "+this.price+"\n";
		return result;
	}

}
