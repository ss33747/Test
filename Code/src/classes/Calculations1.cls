public class Calculations1{
	//Addition
	//Non-Static methods or instance methods
	public void doSum(integer a,integer b){
		
		integer c;
		
		c = a+b;
		
		system.debug('Sum is:'+c);
	}
	//Substraction
	public void doSub(integer a,integer b){
		
		integer c;
		
		c = a-b;
		
		system.debug('Substraction of 3 and 5 is:'+c);
	}
	//Static method
	public static void doSum1(integer a,integer b){
		integer c;
		
		c = a+b;
		
		system.debug('Sum from Static method:'+c);
	}
	
}