import UIKit

var str = "Hello, playground"


/*Given a 2D board and a word, find if the word exists in the grid.

The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

Example:

board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]

Given word = "ABCCED", return true.
Given word = "SEE", return true.
Given word = "ABCB", return false.
 */


class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        var charArray = Array(word)
        var board = board
    
        for i in 0..<board.count{
            for j in 0..<board[i].count{
                if charArray[0] == board[i][j] && dfs(&board,&charArray,i,j,0) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func dfs(_ board: inout [[Character]], _ charArray: inout [Character],_ i:Int,_ j:Int,_ index:Int) -> Bool{
        
        if charArray.count == index {
            return true
        }
        
        if i < 0 || i >= board.count || j < 0 ||  j >= board[i].count || board[i][j] != charArray[index] {
            return false
        }
        
        let temp = board[i][j]
        board[i][j] = "*"
        let found = dfs(&board, &charArray, i+1, j, index+1)
                || dfs(&board, &charArray, i, j+1, index+1)
                || dfs(&board, &charArray, i-1, j, index+1)
                || dfs(&board, &charArray, i, j-1, index+1)
        
        board[i][j] = temp
        return found
    }
    
}


var sol = Solution()
sol.exist([["a"]], "ab")
