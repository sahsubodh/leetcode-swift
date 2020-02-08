import UIKit

var str = "Hello, playground"



/*The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.



Given an integer n, return all distinct solutions to the n-queens puzzle.

Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.

Example:

Input: 4
Output: [
 [".Q..",  // Solution 1
  "...Q",
  "Q...",
  "..Q."],

 ["..Q.",  // Solution 2
  "Q...",
  "...Q",
  ".Q.."]
]
Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.*/


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
    
    
    
    func solveNQueens(_ n: Int) -> [[String]] {
        var result:[[String]] = []
        let row:[Character] = Array.init(repeating: ".", count: n)
        var board:[[Character]] = Array.init(repeating: row, count: n)
        
        backtrack(&board,&result,0);
        
        return result
    }
    
    func backtrack(_ board: inout [[Character]],_ result : inout [[String]],_ col:Int){
        if col == board.count{
            result.append(build(board));
        } 
        
        for i in 0..<board.count{
            if valid(board,i,col) {
                board[i][col] = "Q";
                backtrack(&board, &result, col+1)
                board[i][col] = ".";
            }
        }
    }
    
    func build(_ board:[[Character]]) -> [String]{
        var ressult_str:[String] = []
        
        for row in board {
            ressult_str.append(String(row))
        }
        
        return ressult_str
    }
    
    
    func valid(_ board:[[Character]], _ x:Int, _ y: Int) -> Bool{
           for i in 0..<board.count{
               for j in 0...y{
                   if board[i][j] == "Q" && (i == x || j == y || x + y == i + j || x - y == i - j){
                       return false
                   }
               }
           }
           return true
       }
}





