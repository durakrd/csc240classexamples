public class IntroLab1 {

	public static double addtwo(double N) {
		return N + 2;
	}

	public static double addnum(double num1, double num2) {
		return num1 + num2;
	}

	public static void main(String[] args) {
		double[] numArr = new double[15];
		for (double ii = 0; ii < 15; ii++) {
			if (ii % 2 == 0) {
				System.out.println(addtwo(ii));
			}
			numArr[(int) ii] = ii;
		}

		System.out.println("\n");
		System.out.println(numArr[0]);
		for (int jj = 1; jj < numArr.length; jj++) {
			System.out.print(numArr[jj] + " ");
		}

	}
}
