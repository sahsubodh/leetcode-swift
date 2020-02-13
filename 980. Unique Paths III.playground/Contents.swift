import UIKit

var str = "Hello, playground"

/*
 On a 2-dimensional grid, there are 4 types of squares:

 1 represents the starting square.  There is exactly one starting square.
 2 represents the ending square.  There is exactly one ending square.
 0 represents empty squares we can walk over.
 -1 represents obstacles that we cannot walk over.
 Return the number of 4-directional walks from the starting square to the ending square, that walk over every non-obstacle square exactly once.

  

 Example 1:

 Input: [[1,0,0,0],[0,0,0,0],[0,0,2,-1]]
 Output: 2
 Explanation: We have the following two paths:
 1. (0,0),(0,1),(0,2),(0,3),(1,3),(1,2),(1,1),(1,0),(2,0),(2,1),(2,2)
 2. (0,0),(1,0),(2,0),(2,1),(1,1),(0,1),(0,2),(0,3),(1,3),(1,2),(2,2)
 Example 2:

 Input: [[1,0,0,0],[0,0,0,0],[0,0,0,2]]
 Output: 4
 Explanation: We have the following four paths:
 1. (0,0),(0,1),(0,2),(0,3),(1,3),(1,2),(1,1),(1,0),(2,0),(2,1),(2,2),(2,3)
 2. (0,0),(0,1),(1,1),(1,0),(2,0),(2,1),(2,2),(1,2),(0,2),(0,3),(1,3),(2,3)
 3. (0,0),(1,0),(2,0),(2,1),(2,2),(1,2),(1,1),(0,1),(0,2),(0,3),(1,3),(2,3)
 4. (0,0),(1,0),(2,0),(2,1),(1,1),(0,1),(0,2),(0,3),(1,3),(1,2),(2,2),(2,3)
 Example 3:

 Input: [[0,1],[2,0]]
 Output: 0
 Explanation:
 There is no path that walks over every empty square exactly once.
 Note that the starting and ending square can be anywhere in the grid.
  

 Note:

 1 <= grid.length * grid[0].length <= 20
 */

//https://leetcode.com/problems/unique-paths-iii/discuss/289954/Java-Solution-DFS-With-backtracking
//Since the requirement is to touch every empty cell exactly once, we need dfs and maintain a step count count for the recursive path and when we reach destination, we compare how many empty cells we covered.
//To avoid cycles in the path, we mark the cells in the current dfs path as blockers and remove them while coming back.

class Solution {
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        var x = 0 , y = 0 , empty = 0
        var grid = grid
        
        for i in 0..<grid.count{
            for j in 0..<grid[0].count{
                if grid[i][j] == 0 {
                    empty += 1
                } else if grid[i][j] == 1 {
                    x = i
                    y = j
                }
            }
        }
        return dfs(grid, x, y, -1 , empty)
    }
    
    func dfs(_ grid:[[Int]],_ i:Int,_ j:Int,_ count:Int,_ need:Int) -> Int {
        
        var grid = grid
        
        if i < 0 || i == grid.count || j < 0 || j == grid[0].count || grid[i][j] == -1 {
            return 0
        }
        
        if grid[i][j] == 2 {
            if count == need {
                return 1
            } else {
                return 0
            }
        }
        
        grid[i][j] = -1
        var total = dfs(grid,i-1, j, count+1 , need)
        total += dfs(grid,i+1, j, count+1 , need)
        total += dfs(grid,i, j-1, count+1 , need)
        total += dfs(grid,i, j+1, count+1 , need)
        
        
        grid[i][j] = 0
        return total
    }
}
