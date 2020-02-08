import UIKit

var str = "Hello, playground"

/*
 Given a positive integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.

 Example:

 Input: 3
 Output:
 [
  [ 1, 2, 3 ],
  [ 8, 9, 4 ],
  [ 7, 6, 5 ]
 ]
 */


class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
              
        var matrix:[[Int]] = Array.init(repeating:Array.init(repeating:0,count:n),count:n)
        
        guard n > 0 else {
            return []
        }
        
        var startRow = 0 , startCol = 0
        var endRow = matrix.count-1 , endCol = matrix[0].count-1
        var dir = 0
        var num = 1
        
        while (startRow <= endRow && startCol <= endCol) {
            switch dir {
                case 0:  //right
                    for col in stride(from: startCol, through :endCol, by: 1){
                        matrix[startRow][col] = num
                        num += 1
                    }
                    startRow += 1
                break;
                case 1:  //down
                    for row in stride(from: startRow, through :endRow, by: 1){
                        matrix[row][endCol] = num
                        num += 1
                    }
                    endCol -= 1
                break;
                case 2: //left
                    for col in stride(from: endCol, through :startCol, by: -1){
                        matrix[endRow][col] = num
                        num += 1
                    }
                    endRow -= 1
                case 3: //up
               for row in stride(from: endRow, through :startRow, by: -1){
                        matrix[row][startCol] = num
                        num += 1
                    }
                    startCol += 1
            default:
                break;
            }
            
            dir = (dir + 1) % 4
        }
        
        return matrix
    }
}

var sol = Solution()
sol.generateMatrix(3)
