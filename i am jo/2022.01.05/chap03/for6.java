//중첩된 반복문과 break 반복문
package chap03;

public class for6 {
	public static void main(String args[]) {
		for (int row = 0; row < 3; row++) {
		for (int col = 0; col < 5; col++) {
		System.out.println("(" + row + ", " + col + ")");
		if ((row == 1) && (col == 3))
		break;
		}
		}
		System.out.println("Done.");
		}
		}