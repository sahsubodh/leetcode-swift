import UIKit

var str = "Hello, playground"


/*
 Given a matrix with r rows and c columns, find the maximum score of a path starting at [0, 0] and ending at [r-1, c-1]. The score of a path is the minimum value in that path. For example, the score of the path 8 → 4 → 5 → 9 is 4.

 Don't include the first or final entry. You can only move either down or right at any point in time.

 Example 1:

 Input:
 [[5, 1],
  [4, 5]]

 Output: 4
 Explanation:
 Possible paths:
 5 → 1 → 5 => min value is 1
 5 → 4 → 5 => min value is 4
 Return the max value among minimum values => max(4, 1) = 4.
 Example 2:

 Input:
 [[1, 2, 3]
  [4, 5, 1]]

 Output: 4
 Explanation:
 Possible paths:
 1-> 2 -> 3 -> 1
 1-> 2 -> 5 -> 1
 1-> 4 -> 5 -> 1
 So min of all the paths = [2, 2, 4]. Note that we don't include the first and final entry.
 Return the max of that, so 4.
 Related problems:

 https://leetcode.com/problems/minimum-path-sum/
 https://leetcode.com/problems/unique-paths-ii/
 https://leetcode.com/problems/path-with-maximum-minimum-value (premium) is a different problem. In this problem we can only move in 2 directions.
 */

//https://leetcode.com/discuss/interview-question/383669/

func MaxMinPath(_ matrix:[[Int]]) -> Int
{
    let m = matrix.count
    let n = matrix[0].count
    
    if m == 0 && n == 0 {
        return 0
    }
    
    var dp = matrix
    for i in 2..<m {
        dp[0][i] = min(dp[0][i], dp[0][i-1])
    }
    
    
    for i in 2..<m {
        dp[i][0] = min(dp[i][0], dp[i-1][0])
    }
    
    for i in 1..<m {
        for j in 1..<n {
            if i == m-1 && j == n-1 {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            } else {
                dp[i][j] = max(min(dp[i-1][j], dp[i][j]),min(dp[i][j-1], dp[i][j]))
            }
        }
    }
    
    
    
    return dp[m-1][n-1]
    
}


var matrix = [[5, 1],[4, 5]]
var matrix1 = [[1, 2, 3],[4, 5, 1]]

print(MaxMinPath(matrix))
print(MaxMinPath(matrix1))
