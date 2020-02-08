import UIKit

var str = "Hello, playground"

/*Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.

Example:

Input:
[
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
Output: 7
Explanation: Because the path 1→3→1→1→1 minimizes the sum.*/


class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        
        let m = grid.count
        let n = grid[0].count
        
        var grid = grid

        for i in 0..<m{
            for j in 0..<n{
                if i == 0 && j != 0{
                    grid[i][j] += grid[i][j-1]
                }
                
                if i != 0 && j == 0{
                    grid[i][j] += grid[i-1][j]
                }
                
                if i != 0 && j != 0{
                    grid[i][j] += min(grid[i-1][j],grid[i][j-1])
                }
            }
        }
    
        
        return grid[m-1][n - 1]
    }
}

var sol = Solution()
sol.minPathSum([[1,3,1],[1,5,1],[4,2,1]])
