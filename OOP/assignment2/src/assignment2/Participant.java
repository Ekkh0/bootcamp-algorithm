package assignment2;

class Participant {
	private int number;
	private String Username;
	
	public Participant(int number, String username) {
		this.number = number;
		Username = username;
	}
	
	public int getNumber() {
		return number;
	}
	
	public void setNumber(int number) {
		this.number = number;
	}
	
	public String getUsername() {
		return Username;
	}
	
	public void setUsername(String username) {
		Username = username;
	}
	
}
