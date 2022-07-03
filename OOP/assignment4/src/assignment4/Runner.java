package assignment4;

public abstract class Runner implements Move, Comparable<Runner>{
	String name;
	String type;
	Integer speed;
	Integer distance=0;
	
	public Runner(String name, String type) {
		this.name = name;
		this.type = type;
	}
	
	public abstract Integer generateRunSpeed();
	
	public String toString() {
		String temp="";
		temp+=this.name+" ";
		temp+=this.type+" ";
		temp+=this.distance+" ";
		return temp;
	}
	
	@Override
	public int compareTo(Runner r) {
		return ((Runner) r).distance-this.distance;
	}
	
}
