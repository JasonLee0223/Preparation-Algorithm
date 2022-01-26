import Foundation

/*
 * Complete the 'diagonalDifference' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY arr as parameter.
 */

//arr = 3
//      11 2 4
//      4 5 6
//      10 8 -12
func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    var leftLine = 0
    var rightLine = 0

    for i in 0..<arr.count {
        leftLine += arr[i][i]
        rightLine += arr[i][arr.count-1-i]
    }

    return abs(leftLine - rightLine)
}
