import UIKit

var str = "Hello, playground"

/*
 Given an m x n matrix of non-negative integers representing the height of each unit cell in a continent, the "Pacific ocean" touches the left and top edges of the matrix and the "Atlantic ocean" touches the right and bottom edges.
 
 Water can only flow in four directions (up, down, left, or right) from a cell to another one with height equal or lower.
 
 Find the list of grid coordinates where water can flow to both the Pacific and Atlantic ocean.
 
 Note:
 
 The order of returned grid coordinates does not matter.
 Both m and n are less than 150.
 
 
 Example:
 
 Given the following 5x5 matrix:
 
 Pacific ~   ~   ~   ~   ~
 ~  1   2   2   3  (5) *
 ~  3   2   3  (4) (4) *
 ~  2   4  (5)  3   1  *
 ~ (6) (7)  1   4   5  *
 ~ (5)  1   1   2   4  *
 *   *   *   *   * Atlantic
 
 Return:
 
 [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]] (positions with parentheses in above matrix).
 */

class Solution {
    
    let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    
    func pacificAtlantic_BFS(_ matrix: [[Int]]) -> [[Int]] {
        if matrix.count == 0 || matrix[0].count == 0 {
            return [[Int]]()
        }
        
        let n = matrix.count
        let m = matrix[0].count
        var result = [[Int]]()
        var pacific = [[Bool]](repeatElement([Bool](repeatElement(false, count: m)), count: n))
        var atlantic = [[Bool]](repeatElement([Bool](repeatElement(false, count: m)), count: n))
        var pQueue = [[Int]]()
        var aQueue = [[Int]]()
        
        for i in 0..<n {
            pQueue.append([i, 0])
            aQueue.append([i, m - 1])
            pacific[i][0] = true
            atlantic[i][m - 1] = true
        }
        for i in 0..<m {
            pQueue.append([0, i])
            aQueue.append([n - 1, i])
            pacific[0][i] = true
            atlantic[n - 1][i] = true
        }
        BFS(matrix, pQueue, &pacific)
        BFS(matrix, aQueue, &atlantic)
        for i in 0..<n {
            for j in 0..<m {
                if pacific[i][j] && atlantic[i][j] {
                    result.append([i, j])
                }
            }
        }
        
        return result
    }
    
    private func BFS(_ matrix: [[Int]], _ queue: [[Int]], _ visited: inout [[Bool]]) {
        let n = matrix.count
        let m = matrix[0].count
        var queue = queue
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            for direction in self.directions {
                let x = current[0] + direction[0]
                let y = current[1] + direction[1]
                if x < 0 || x >= n || y < 0 || y >= m || visited[x][y] || matrix[x][y] < matrix[current[0]][current[1]] {
                    continue
                }
                visited[x][y] = true
                queue.append([x, y])
            }
        }
    }
}
