public class IntroLab3 {

	public static void makeChange(int amount) {
		if (amount > 100) {
			System.err.println("Can't be more than 100!");
		}
		System.out.println("Change for " + amount + ":");
		int[] coinArr = { 25, 10, 5, 1 };
		int[] rtnArr = { 0, 0, 0, 0 };
		String[] strArr = { "  quarters: ", "  dimes: ", "  nickels: ", "  pennies: " };

		int ii = 0;
		while (ii != rtnArr.length) {
			int currCoin = coinArr[ii];
			if (amount >= currCoin) {
				rtnArr[ii] = amount / currCoin;
				amount -= currCoin * rtnArr[ii];
			}
			ii++;
		}
		for (int jj = 3; jj >= 0; jj--) {
			System.out.println(strArr[jj] + rtnArr[jj]);
		}
	}

	public static void main(String[] args) {
		makeChange(25);
		makeChange(97);
	}

}
