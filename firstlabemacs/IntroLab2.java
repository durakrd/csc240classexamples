public class IntroLab2 {
	public static double fact(int n) {
	double fin = 1;
	for (int ii = 2; ii<n; ii++) {
	    fin *= ii;
	}
	return fin;
    }

	public static void main(String[] args) {
		System.out.println("fact(4): " + fact(4));
		System.out.println("fact(100): " + fact(100));
	}
}
