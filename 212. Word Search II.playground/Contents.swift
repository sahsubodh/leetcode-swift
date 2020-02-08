import UIKit

var str = "Hello, playground"


/*
 Given a 2D board and a list of words from the dictionary, find all words in the board.

 Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

  

 Example:

 Input:
 board = [
   ['o','a','a','n'],
   ['e','t','a','e'],
   ['i','h','k','r'],
   ['i','f','l','v']
 ]
 words = ["oath","pea","eat","rain"]

 Output: ["eat","oath"]
 */

class TrieNode{
    var word:String?
    var children = [Character:TrieNode]()
}


class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
     
        let trieRoot = buildTrie(words)
        
        var result = Set<String> ()
        var board = board
        
        for i in 0..<board.count{
            for j in 0..<board[i].count{
                dfs(&board,i,j,trieRoot,&result)
            }
        }
        
        
        return Array(result)
    }
    
    func dfs(_ board: inout [[Character]],_ i:Int,_ j:Int,_ trieNode:TrieNode,_ result:inout Set<String>)
    {
        if let word = trieNode.word {
            result.insert(word)
        }
        
        guard i >= 0 && j >= 0 && i < board.count && j < board[i].count else { return }
        guard board[i][j] != "#" else { return }

        
        let char = board[i][j]
        guard let nextTrieNode = trieNode.children[char] else { return }
        
        var board = board
        board[i][j] = "#"
        
        for (nexti, nextj) in [(i-1, j), (i+1, j), (i, j-1), (i, j+1)] {
            dfs(&board, nexti, nextj, nextTrieNode, &result)
        }
        
        board[i][j] = char
        
    }
    
    func buildTrie(_ words: [String]) -> TrieNode {
        let root = TrieNode()
        for word in words {
            var node = root
            for char in word{
                if node.children[char] == nil {
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            
            node.word = word
        }
        
        return root
    }
}
