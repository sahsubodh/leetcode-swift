import UIKit

var str = "Hello, playground"

/*Given a 2D matrix matrix, find the sum of the elements inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).

Range Sum Query 2D
The above rectangle (with the red border) is defined by (row1, col1) = (2, 1) and (row2, col2) = (4, 3), which contains sum = 8.

Example:
Given matrix = [
  [3, 0, 1, 4, 2],
  [5, 6, 3, 2, 1],
  [1, 2, 0, 1, 5],
  [4, 1, 0, 1, 7],
  [1, 0, 3, 0, 5]
]

sumRegion(2, 1, 4, 3) -> 8
sumRegion(1, 1, 2, 2) -> 11
sumRegion(1, 2, 2, 4) -> 12
Note:
You may assume that the matrix does not change.
There are many calls to sumRegion function.
You may assume that row1 ≤ row2 and col1 ≤ col2.
 */

//https://leetcode.com/problems/range-sum-query-2d-immutable/discuss/75350/Clean-C%2B%2B-Solution-and-Explaination-O(mn)-space-with-O(1)-time

class NumMatrix {
    
    var dp:[[Int]]

    init(_ matrix: [[Int]]) {
        
        dp = matrix
        for i in 0..<matrix.count{
            for j in 0..<matrix[0].count{
                // left, top, left top
                let l = (j>0) ? dp[i][j-1] : 0
                let t = (i>0) ? dp[i-1][j] : 0
                let lt = (i>0 && j>0) ? dp[i-1][j-1] :0
                dp[i][j] += (l+t-lt)
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        // left, top, left top
        let l = (col1 > 0 ? dp[row2][col1-1]:0)
        let t = (row1 > 0 ? dp[row1-1][col2]:0)
        let lt = (row1 > 0 && col1 > 0) ? dp[row1-1][col1-1] : 0
        return dp[row2][col2] - (l+t-lt)
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
