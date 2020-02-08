import UIKit

var str = "Hello, playground"


/*
 Design a data structure that supports the following two operations:

void addWord(word)
bool search(word)
search(word) can search a literal word or a regular expression string containing only letters a-z or .. A . means it can represent any one letter.

Example:

addWord("bad")
addWord("dad")
addWord("mad")
search("pad") -> false
search("bad") -> true
search(".ad") -> true
search("b..") -> true
Note:
You may assume that all words are consist of lowercase letters a-z.
 */



class WordDictionary {
    
    private class TrieNode {
        var children:[Character:TrieNode] = [:]
        var isEnd = false
    }
    
    private let root :TrieNode

    /** Initialize your data structure here. */
    init() {
        root = TrieNode()
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            
            node = node.children[char]!
        }
        node.isEnd = true
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        return dfs(root,Array(word),0)
    }
    
    private func dfs(_ node:TrieNode,_ chars:[Character],_ nextIndex:Int) -> Bool {
        if nextIndex == chars.count {
            return node.isEnd
        }
        
        for (nextChar,nextNode) in node.children where nextChar == chars[nextIndex] || chars[nextIndex] == "." {
            if dfs(nextNode, chars, nextIndex+1) {
                return true
            }
        }
       
        return false
    }
    

}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
