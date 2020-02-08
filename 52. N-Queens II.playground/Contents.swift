import UIKit

var str = "Hello, playground"

/*The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.



Given an integer n, return the number of distinct solutions to the n-queens puzzle.

Example:

Input: 4
Output: 2
Explanation: There are two distinct solutions to the 4-queens puzzle as shown below.
[
 [".Q..",  // Solution 1
  "...Q",
  "Q...",
  "..Q."],

 ["..Q.",  // Solution 2
  "Q...",
  "...Q",
  ".Q.."]
]*/


class Solution {
    
    var occupiedCols:Set<Int> = []
    var occupiedDiag1s:Set<Int> = []
    var occupiedDiag2s:Set<Int> = []
    
    func totalNQueens(_ n: Int) -> Int {
        return totalNQueensHelper(row: 0,count: 0,n: n);
    }
    
    func totalNQueensHelper(row:Int,count:Int,n:Int) -> Int {
        var count = count
        
        for col in 0..<n{
            if occupiedCols.contains(col){
                continue;
            }
            let diag1 = row + col
            if occupiedDiag1s.contains(diag1){
                continue
            }
            
            let diag2 = row - col
            if occupiedDiag2s.contains(diag2){
                continue;
            }
            
            if (row == n-1){
                count += 1
            } else {
                occupiedCols.insert(col)
                occupiedDiag1s.insert(diag1)
                occupiedDiag2s.insert(diag2)
                count = totalNQueensHelper(row: row + 1 ,count: count,n: n);
                occupiedCols.remove(col)
                occupiedDiag1s.remove(diag1)
                occupiedDiag2s.remove(diag2)
            }
        }
        
        return count
    }
    
}
