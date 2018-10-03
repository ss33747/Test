public class ConstructorExample{
	//Default constructor
	public ConstructorExample(){
		system.debug('Hello I am constructor...');
	}
	
	//Parameterized constructor
	public ConstructorExample(integer a){
		system.debug('Hello I am parameterized constructor with one param...');
	}
	
	//Parameterized constructor
	public ConstructorExample(integer a,integer b){
		system.debug('Hello I am parameterized constructor with two params...');
	}
	
}