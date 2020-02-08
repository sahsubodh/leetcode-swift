import UIKit

var str = "Hello, playground"


/*
 Implement a trie with insert, search, and startsWith methods.

 Example:

 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");
 trie.search("app");     // returns true
 Note:

 You may assume that all inputs are consist of lowercase letters a-z.
 All inputs are guaranteed to be non-empty strings.
 */


class Trie {
    class Node {
        var char: Character?
        var route: [Character:Node]
        var isWord: Bool
        
        init(_ char: Character?, _ isWord: Bool = false) {
            self.char = char
            self.route = [Character:Node]()
            self.isWord = isWord
        }
    }
    
    var head: Node
    
    /** Initialize your data structure here. */
    init() {
        head = Node(nil)
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var curr = head
        
        for char in word {
            if curr.route[char] == nil {
                curr.route[char] = Node(char)
            }
            curr = curr.route[char]!
        }
        curr.isWord = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var curr = head
        
        for char in word {
            if curr.route[char] == nil {
                return false
            }
            curr = curr.route[char]!
        }
        return curr.isWord
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var curr = head
        
        for char in prefix {
            if curr.route[char] == nil {
                return false
            }
            curr = curr.route[char]!
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
