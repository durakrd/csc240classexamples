import java.util.*;

public class IntroLab3 {

	final static String[] coinArr = { "quarters", "dimes", "nickels", "pennies" };
	final static int[] valArr = { 25, 10, 5, 1 };

	public static void makeChange(int amount) {
		if (amount > 100) {
			System.err.println("Can't be more than 100!");
		}
		System.out.println("Change for " + amount + ":");
		int[] rtnArr = { 0, 0, 0, 0 };

		int ii = 0;
		while (ii != rtnArr.length) {
			int currCoin = valArr[ii];
			if (amount >= currCoin) {
				rtnArr[ii] = amount / currCoin;
				amount -= currCoin * rtnArr[ii];
			}
			ii++;
		}
		for (int jj = 3; jj >= 0; jj--) {
			System.out.println("  " + coinArr[jj] + ": " + rtnArr[jj]);
		}
	}

	public static void allChange(int amount, ArrayList<Integer> tally,
			HashSet<ArrayList<Integer>> combs) {
		if (amount == 0 && !combs.contains(tally)) {
			combs.add(tally);
			System.out.println("pennies: " + tally.get(3));
			System.out.println("nickels: " + tally.get(2));
			System.out.println("dimes: " + tally.get(1));
			System.out.println("quarters: " + tally.get(0) + "\n");
		} else if (amount < 0 || combs.contains(tally)) {
			return;
		} else {
			combs.add(tally);
			for (int ii = 0; ii < 4; ii++) {
				ArrayList<Integer> tempArr = (ArrayList<Integer>) tally.clone();
				tempArr.set(ii, tempArr.get(ii) + 1);
				allChange(amount - valArr[ii], tempArr, combs);
			}
		}
	}

	public static void allChange(int amount) {
		HashSet<ArrayList<Integer>> combs = new HashSet<ArrayList<Integer>>();
		System.out.println("Combinations of change for " + amount + ":");
		ArrayList<Integer> initArr = new ArrayList<Integer>(Collections.nCopies(4, 0)); // {q, d, n, p}
		allChange(amount, initArr, combs);
	}

	public static void main(String[] args) {
		makeChange(25);
		makeChange(97);

		System.out.println();

		allChange(15);
		allChange(75);
	}
}
