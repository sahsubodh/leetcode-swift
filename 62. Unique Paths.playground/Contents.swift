import UIKit

var str = "Hello, playground"


/*
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 How many possible unique paths are there?


 Above is a 7 x 3 grid. How many possible unique paths are there?

 Note: m and n will be at most 100.

 Example 1:

 Input: m = 3, n = 2
 Output: 3
 Explanation:
 From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Right -> Down
 2. Right -> Down -> Right
 3. Down -> Right -> Right
 Example 2:

 Input: m = 7, n = 3
 Output: 28
 */


class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        var dp:[[Int]] = Array.init(repeating: Array.init(repeating: 0, count: n), count: m)
        
        for i in 0..<m{
            dp[i][0] = 1
        }
        
        for i in 0..<n{
        dp[0][i] = 1
        }
        
        for i in 1..<m{
            for j in 1..<n{
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        
        
        return dp[m-1][n-1]
    }
    
    //https://leetcode.com/problems/unique-paths-ii/discuss/485830/0ms-100-java-solution
    
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        

       var obstacleGrid = obstacleGrid
        guard !obstacleGrid.isEmpty, !obstacleGrid[0].isEmpty, obstacleGrid[0][0] != 1 else { return 0 }
        obstacleGrid[0][0] = 1
        
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        
        for i in 1..<m {
            obstacleGrid[i][0] = obstacleGrid[i][0] == 1 ? 0 : obstacleGrid[i-1][0]
        }
        
        for i in 1..<n {
            obstacleGrid[0][i] = obstacleGrid[0][i] == 1 ? 0 : obstacleGrid[0][i-1]
        }
        
        for i in 1..<m {
            for j in 1..<n {
                obstacleGrid[i][j] = obstacleGrid[i][j] == 1 ? 0 : obstacleGrid[i][j-1] + obstacleGrid[i-1][j]
            }
        }
        return obstacleGrid[m-1][n-1]
    }
}

var sol = Solution()
//sol.uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]])
sol.uniquePathsWithObstacles([[1]])
