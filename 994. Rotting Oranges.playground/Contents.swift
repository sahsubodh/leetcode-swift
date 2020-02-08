import UIKit

var str = "Hello, playground"


/*
 
 In a given grid, each cell can have one of three values:

 the value 0 representing an empty cell;
 the value 1 representing a fresh orange;
 the value 2 representing a rotten orange.
 Every minute, any fresh orange that is adjacent (4-directionally) to a rotten orange becomes rotten.

 Return the minimum number of minutes that must elapse until no cell has a fresh orange.  If this is impossible, return -1 instead.

  

 Example 1:



 Input: [[2,1,1],[1,1,0],[0,1,1]]
 Output: 4
 Example 2:

 Input: [[2,1,1],[0,1,1],[1,0,1]]
 Output: -1
 Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
 Example 3:

 Input: [[0,2]]
 Output: 0
 Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.
  

 Note:

 1 <= grid.length <= 10
 1 <= grid[0].length <= 10
 grid[i][j] is only 0, 1, or 2.
 */


class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        
        var queue:[(Int,Int)] = []
        var grid:[[Int]] = grid
        var fresh_count = 0
        var count = 0
        
        let m = grid.count
        let n = grid[0].count
        
        guard m>0,n>0 else {
            return 0
        }
        
        for i in 0..<m{
            for j in 0..<n{
                if grid[i][j] == 2 {
                    queue.append((i,j))
                } else if  grid[i][j] == 1 {
                    fresh_count += 1
                }
            }
        }
        
        if (fresh_count == 0) {
            return 0
        }
        
        let dir = [[1,0],[-1,0],[0,1],[0,-1]]
        
        while (!queue.isEmpty) {
            count += 1
            let size = queue.count
            for i in 0..<size{
                let coordinates = queue.removeFirst()
                for direction in dir{
                    let x = coordinates.0 + direction[0]
                    let y = coordinates.1 + direction[1]
                    
                    if (x<0 || y<0 || x>=m || y>=n || grid[x][y] == 0 || grid[x][y] == 2)
                    {
                        continue;
                    }
                    
                    grid[x][y] = 2
                    queue.append((x,y))
                    fresh_count -= 1
                }
                
            }
            
        }
        //Because we do count++ every time when queue is not empty. When there is no fresh orange, it still does count++ at the begin of the while loop.


        return fresh_count == 0 ? count-1 : -1
    }
}


var sol = Solution()
sol.orangesRotting([[2,1,1],[1,1,0],[0,1,1]])
sol.orangesRotting([[2,1,1],[0,1,1],[1,0,1]])

