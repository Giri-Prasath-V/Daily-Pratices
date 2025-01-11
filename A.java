package p1;
public class A
{
	public int x=10;
	private int y=20;
	protected int z=30;

	int q=100;

	void display()
	{
		System.out.println(x);
		System.out.println(y);
		System.out.println(z);
		System.out.println(q);


	}


	
}

class B extends A
{
	void display()
	{
		System.out.println(x);
		//System.out.println(y);
		System.out.println(z);
		System.out.println(q);

	}
}

class C
{
	void display()
	{
		A a1=new A();
		System.out.println(a1.x);
		//System.out.println(a1.y);
		System.out.println(a1.z);
		System.out.println(a1.q);

	}

}



