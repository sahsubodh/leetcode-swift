import UIKit

var str = "Hello, playground"

/*
 Write a program to solve a Sudoku puzzle by filling the empty cells.
 
 A sudoku solution must satisfy all of the following rules:
 
 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 Empty cells are indicated by the character '.'.
 
 
 A sudoku puzzle...
 
 
 ...and its solution numbers marked in red.
 
 Note:
 
 The given board contain only digits 1-9 and the character '.'.
 You may assume that the given Sudoku puzzle will have a single unique solution.
 The given board size is always 9x9.
 */


class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        solve(&board)
    }
    
    func solve(_ board: inout [[Character]]) -> Bool{
        for i in 0..<9{
            for j in 0..<9{
                if board[i][j] == "."{
                    for k in "123456789"{
                        if valid(board, i, j, k){
                            board[i][j] = k
                            if solve(&board){
                                return true
                            }
                            board[i][j] = "."
                        }
                    }
                    return false
                }
            }
        }
         return true
    }
    
    func valid(_ board: [[Character]], _ i: Int, _ j: Int, _ k: Character) -> Bool{
        for m in 0..<9{
            if board[i][m] != "." && board[i][m] == k{
                return false
            }
            
            if board[m][j] != "." && board[m][j] == k{
                return false
            }
            
            var rowIndex = i / 3 * 3 + m / 3
            var colIndex = j / 3 * 3 + m % 3
            if board[rowIndex][colIndex] != "." && board[rowIndex][colIndex] == k{
                return false
            }
            
            
        }
        return true
    }
    
    
}
