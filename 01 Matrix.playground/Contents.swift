import UIKit

/*
 Given a matrix consists of 0 and 1, find the distance of the nearest 0 for each cell.

 The distance between two adjacent cells is 1.

  

 Example 1:

 Input:
 [[0,0,0],
  [0,1,0],
  [0,0,0]]

 Output:
 [[0,0,0],
  [0,1,0],
  [0,0,0]]
 Example 2:

 Input:
 [[0,0,0],
  [0,1,0],
  [1,1,1]]

 Output:
 [[0,0,0],
  [0,1,0],
  [1,2,1]]
 */

var str = "Hello, playground"

class Solution {
    
    
    private let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]

    
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
          
          guard matrix.count > 0 else {
              return matrix
          }
          
          let m = matrix.count
          let n = matrix[0].count
          
          var input_matrix = matrix
          
          var queue = [[Int]]()

          for i in 0..<m{
              for j in 0..<n{
                  if input_matrix[i][j] == 0{
                      queue.append([i,j])
                  } else{
                    input_matrix[i][j] = Int.max
                }
              }
          }
        
        
        while (!queue.isEmpty){
            var head = queue.removeFirst()
            for direction in self.directions{
                var x = head[0] + direction[0]
                var y = head[1] + direction[1]
                
                if x < 0 || x >= m || y < 0 || y >= n || input_matrix[x][y] < input_matrix[head[0]][head[1]]{
                    continue
                }
                queue.append([x,y])
                input_matrix[x][y] = input_matrix[head[0]][head[1]] + 1
                
            }
        }

          return input_matrix
      }
    
        
          
          func updateMatrix2(_ matrix: [[Int]]) -> [[Int]] {
              let m = matrix.count
              let n = matrix[0].count
              var result = matrix
              var queue = [[Int]]()
              
              for i in 0..<m {
                  for j in 0..<n {
                      if result[i][j] == 0 {
                          queue.append([i, j])
                      } else {
                          result[i][j] = Int.max
                      }
                  }
              }
              
              while !queue.isEmpty {
                  let cell = queue.removeFirst()
                  for direction in self.directions {
                      let x = cell[0] + direction[0]
                      let y = cell[1] + direction[1]
                      if x < 0 || x >= m || y < 0 || y >= n || result[x][y] <= result[cell[0]][cell[1]] + 1 {
                          continue
                      }
                      queue.append([x, y])
                      result[x][y] = result[cell[0]][cell[1]] + 1
                  }
              }
              
              return result
          }
}

//Input:
//[[0,0,0],[0,1,0],[1,1,1]]
//Output:
//[[0,0,0],[0,1,0],[1,1,1]]
//Expected:
//[[0,0,0],[0,1,0],[1,2,1]]

var input = [[0,0,0],[0,1,0],[1,1,1]]
var sol = Solution()
print(sol.updateMatrix2(input))
