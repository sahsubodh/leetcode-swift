import UIKit

var str = "Hello, playground"

/*
 According to the Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."

 Given a board with m by n cells, each cell has an initial state live (1) or dead (0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):

 Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 Any live cell with two or three live neighbors lives on to the next generation.
 Any live cell with more than three live neighbors dies, as if by over-population..
 Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
 Write a function to compute the next state (after one update) of the board given its current state. The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously.

 Example:

 Input:
 [
   [0,1,0],
   [0,0,1],
   [1,1,1],
   [0,0,0]
 ]
 Output:
 [
   [0,0,0],
   [1,0,1],
   [0,1,1],
   [0,1,0]
 ]
 Follow up:

 Could you solve it in-place? Remember that the board needs to be updated at the same time: You cannot update some cells first and then use their updated values to update other cells.
 In this question, we represent the board using a 2D array. In principle, the board is infinite, which would cause problems when the active area encroaches the border of the array. How would you address these problems?
 */

//https://leetcode.com/problems/game-of-life/discuss/73271/Python-Solution-with-detailed-explanation

class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        
        guard board.count > 0 else { return }
        guard board[0].count > 0 else { return }
        
        for i in 0..<board.count
        {
            for j in 0..<board[i].count
            {
                //cell is dead
                if board[i][j] == 0 {
                    if getLivesCount(board, i, j) == 3 {
                        board[i][j] = 3
                    }
                }
                
                //cell is alive
                if board[i][j] == 1 {
                    if getLivesCount(board, i, j) < 2 || getLivesCount(board, i, j) > 3 {
                        board[i][j] = 2
                    }
                }
                
            }
            
        }
        
    }
    
    private func getLivesCount(_ board: [[Int]], _ i: Int, _ j: Int) -> Int {
        let dimensions:[[Int]] = [
        [-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
        var lives = 0
        
        for d in dimensions{
            let x = d[0] + i
            let y = d[1] + j
            
            guard x >= 0 && x < board.count && y >= 0 && y < board[x].count else {
                continue
            }
            
            if board[x][y] == 1 || board[x][y] == 3{
                lives += 1
            }
        }
        
        return lives
    }
}
