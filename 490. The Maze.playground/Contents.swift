import UIKit

var str = "Hello, playground"

/*There is a ball in a maze with empty spaces and walls. The ball can go through empty spaces by rolling up, down, left or right, but it won't stop rolling until hitting a wall. When the ball stops, it could choose the next direction.

Given the ball's start position, the destination and the maze, determine whether the ball could stop at the destination.

The maze is represented by a binary 2D array. 1 means the wall and 0 means the empty space. You may assume that the borders of the maze are all walls. The start and destination coordinates are represented by row and column indexes.

 

Example 1:

Input 1: a maze represented by a 2D array

0 0 1 0 0
0 0 0 0 0
0 0 0 1 0
1 1 0 1 1
0 0 0 0 0

Input 2: start coordinate (rowStart, colStart) = (0, 4)
Input 3: destination coordinate (rowDest, colDest) = (4, 4)

Output: true

Explanation: One possible way is : left -> down -> left -> down -> right -> down -> right.

Example 2:

Input 1: a maze represented by a 2D array

0 0 1 0 0
0 0 0 0 0
0 0 0 1 0
1 1 0 1 1
0 0 0 0 0

Input 2: start coordinate (rowStart, colStart) = (0, 4)
Input 3: destination coordinate (rowDest, colDest) = (3, 2)

Output: false

Explanation: There is no way for the ball to stop at the destination.

 

Note:

There is only one ball and one destination in the maze.
Both the ball and the destination exist on an empty space, and they will not be at the same position initially.
The given maze does not contain border (like the red rectangle in the example pictures), but you could assume the border of the maze are all walls.
The maze contains at least 2 empty spaces, and both the width and height of the maze won't exceed 100.*/


class Solution {
    struct cell {
        let x: Int
        let y:Int
    }
    
    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
        
        var visited:[[Bool]] = Array.init(repeating: Array.init(repeating: false, count: maze[0].count), count: maze.count)
        let dirs = [[-1,0],[1,0],[0,-1],[0,1]]
        
        var queue:[cell] = []
        queue.append(cell(x: start[0], y: start[1]))
        
        while (!queue.isEmpty){
            let cur = queue.removeFirst()
            visited[cur.x][cur.y] = true
            
            if cur.x == destination[0] && cur.y == destination[1] {
                return true
            }
            
            for dir in dirs where isValid(maze, cur.x+dir[0], cur.y+dir[1]){
                if !visited[cur.x+dir[0]][cur.y+dir[1]]{
                    queue.append(cell(x: cur.x+dir[0], y: cur.y+dir[1]))
                }
            }
        }
        
        
        return false
    }
    
    func isValid(_ maze: [[Int]],_ row:Int,_ col:Int) -> Bool {
        return row >= 0 && col >= 0 && row < maze.count && col < maze[0].count
            && maze[row][col] != 1
    }
}
