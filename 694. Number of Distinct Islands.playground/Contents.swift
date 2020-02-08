import UIKit

var str = "Hello, playground"

/*
 Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

 Count the number of distinct islands. An island is considered to be the same as another if and only if one island can be translated (and not rotated or reflected) to equal the other.

 Example 1:
 11000
 11000
 00011
 00011
 Given the above grid map, return 1.
 Example 2:
 11011
 10000
 00001
 11011
 Given the above grid map, return 3.

 Notice that:
 11
 1
 and
  1
 11
 are considered different island shapes, because we do not consider reflection / rotation.
 Note: The length of each dimension in the given grid does not exceed 50.
 */


class Solution {
    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        var set = Set<String>()
        var grid = grid
        for i in 0..<grid.count{
            for j in 0..<grid[0].count{
                if grid[i][j] != 0 {
                    var result = ""
                    dfs(&grid, i, j, &result,"o")
                    grid[i][j] = 0
                    set.insert(result)
                }
                
            }
        }
        return set.count
    }
    
    func dfs(_ grid: inout [[Int]],_ i:Int,_ j:Int,_ result:inout String,_ direction:String){
        if i<0 || i == grid.count || j<0 || j == grid[i].count || grid[i][j] == 0 {
            return
        }
        result += direction
        grid[i][j] = 0

        dfs(&grid, i+1, j, &result,"d")
        dfs(&grid, i-1, j, &result,"u")
        dfs(&grid, i, j+1, &result,"r")
        dfs(&grid, i, j-1, &result,"l")
        
        result += "b"
    }
}
