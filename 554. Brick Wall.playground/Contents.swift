import UIKit

var str = "Hello, playground"

/*
 
 There is a brick wall in front of you. The wall is rectangular and has several rows of bricks. The bricks have the same height but different width. You want to draw a vertical line from the top to the bottom and cross the least bricks.

 The brick wall is represented by a list of rows. Each row is a list of integers representing the width of each brick in this row from left to right.

 If your line go through the edge of a brick, then the brick is not considered as crossed. You need to find out how to draw the line to cross the least bricks and return the number of crossed bricks.

 You cannot draw a line just along one of the two vertical edges of the wall, in which case the line will obviously cross no bricks.

  

 Example:

 Input: [[1,2,2,1],
         [3,1,2],
         [1,3,2],
         [2,4],
         [3,1,2],
         [1,3,1,1]]

 Output: 2

 Explanation:


 Note:

 The width sum of bricks in different rows are the same and won't exceed INT_MAX.
 The number of bricks in each row is in range [1,10,000]. The height of wall is in range [1,10,000]. Total number of bricks of the wall won't exceed 20,000.
 */

//https://leetcode.com/problems/brick-wall/


class Solution {
    func leastBricks(_ wall: [[Int]]) -> Int {
        if wall.count == 0 { return 0 }
        
        var count = 0
        
        var dict:[Int:Int] = [:]
        
        for i in 0..<wall.count {
            var len = 0
            for j in 0..<wall[i].count-1 {
                 len += wall[i][j]
                dict[len,default:0] = dict[len,default:0] + 1
                count = max(count,dict[len]!)
            }
        }
    
        print(wall.count)
        print(count)
        return wall.count - count
    }
}

var input = [[1,2,2,1],[3,1,2],[1,3,2],[2,4],[3,1,2],[1,3,1,1]]

var sol = Solution()
sol.leastBricks(input)
