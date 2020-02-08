import UIKit

var str = "Hello, playground"


/*Given a matrix of M x N elements (M rows, N columns), return all elements of the matrix in diagonal order as shown in the below image.

 

Example:

Input:
[
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]

Output:  [1,2,4,7,5,3,6,8,9]

Explanation:

Note:

The total number of elements of the given matrix will not exceed 10,000.
 */

class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
           
           var result = [Int]()

           guard matrix.count > 0 else
           {
               return []
           }
           var colIndex = 0, rowIndex = 0, nCol = matrix[0].count, nRow = matrix.count
           
           for i in 0..<nRow * nCol
           {
               result.append(matrix[rowIndex][colIndex])
               // moving up
               if ((colIndex + rowIndex) % 2 == 0)
               {
                   if colIndex == nCol - 1
                   {
                       rowIndex += 1
                   }
                   else if rowIndex == 0
                   {
                     colIndex += 1
                   }
                   else
                   {
                       colIndex += 1
                       rowIndex -= 1
                   }
               }
               // moving down
               else
               {
                   if rowIndex == nRow - 1
                   {
                       colIndex += 1
                   }
                   else if colIndex == 0
                   {
                     rowIndex += 1
                   }
                   else
                   {
                       rowIndex += 1
                       colIndex -= 1
                   }
               }
           }
           return result
       }
    
    //not working :(
    func findDiagonalOrder1(_ matrix: [[Int]]) -> [Int] {

        guard matrix.count > 0 else {
            return []
        }
        
        let m = matrix.count
        let n = matrix[0].count
        
        var r = 0, c = 0
        var result:[Int] = Array.init(repeating: 0 , count: m*n)
        
        for i in 0..<result.count{
            print("hello1")

            // going up
            // The direction is always up when the sum of row & col is even
            
            print("i is \(i) with \(result[i])")
            print("r \(r) c \(c)")

            result.append(matrix[r][c])
            print("hello2")

            if (r+c % 2 == 0) {
                // For last column, go down
                if c == n-1 { r += 1 }
                // For first row & non-last columns, go right
                else if r == 0 { c += 1 }
                // For not first row & non-last columns, go up and to the right
                else {
                    c += 1
                    r -= 1
                }
            } else {
                if r == m-1 { c += 1 }
                else if c == 0 { r += 1 }
                else {
                    r += 1
                    c -= 1
                }
            }
        }
        
        return result
    }
}


var sol = Solution()
sol.findDiagonalOrder([[1,2,3],[4,5,6],[7,8,9]])
