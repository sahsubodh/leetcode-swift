import UIKit

var str = "Hello, playground"


/*
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

Example 1:

Input:
[
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]
Output: [1,2,3,6,9,8,7,4,5]
Example 2:

Input:
[
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9,10,11,12]
]
Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 */


class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        var result:[Int] = []
        guard matrix.count > 0 else {
            return result
        }
        
        var startRow = 0 , startCol = 0
        var endRow = matrix.count-1 , endCol = matrix[0].count-1
        var dir = 0
        
        while (startRow <= endRow && startCol <= endCol) {
            switch dir {
                case 0:  //right
                    for col in stride(from: startCol, through :endCol, by: 1){
                        result.append(matrix[startRow][col])
                    }
                    startRow += 1
                break;
                case 1:  //down
                    for row in stride(from: startRow, through :endRow, by: 1){
                        result.append(matrix[row][endCol])
                    }
                    endCol -= 1
                break;
                case 2: //left
                    for col in stride(from: endCol, through :startCol, by: -1){
                        result.append(matrix[endRow][col])
                    }
                    endRow -= 1
                case 3: //up
               for row in stride(from: endRow, through :startRow, by: -1){
                              result.append(matrix[row][startCol])
                          }
                    startCol += 1
            default:
                break;
            }
            
            
            
            dir = (dir + 1) % 4
        }
        
        
        return result
    }
}


var sol = Solution()

var matrix = [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]

sol.spiralOrder(matrix)
