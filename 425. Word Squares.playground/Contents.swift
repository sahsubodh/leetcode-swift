import UIKit

var str = "Hello, playground"


/*
 Given a set of words (without duplicates), find all word squares you can build from them.

 A sequence of words forms a valid word square if the kth row and column read the exact same string, where 0 ≤ k < max(numRows, numColumns).

 For example, the word sequence ["ball","area","lead","lady"] forms a word square because each word reads the same both horizontally and vertically.

 b a l l
 a r e a
 l e a d
 l a d y
 Note:
 There are at least 1 and at most 1000 words.
 All words will have the exact same length.
 Word length is at least 1 and at most 5.
 Each word contains only lowercase English alphabet a-z.
 Example 1:

 Input:
 ["area","lead","wall","lady","ball"]

 Output:
 [
   [ "wall",
     "area",
     "lead",
     "lady"
   ],
   [ "ball",
     "area",
     "lead",
     "lady"
   ]
 ]

 Explanation:
 The output consists of two word squares. The order of output does not matter (just the order of words in each word square matters).
 Example 2:

 Input:
 ["abat","baba","atan","atal"]

 Output:
 [
   [ "baba",
     "abat",
     "baba",
     "atan"
   ],
   [ "baba",
     "abat",
     "baba",
     "atal"
   ]
 ]

 Explanation:
 The output consists of two word squares. The order of output does not matter (just the order of words in each word square matters).
 */



//My first approach is brute-force, try every possible word sequences, and use the solution of Problem 422 (https://leetcode.com/problems/valid-word-square/) to check each sequence. This solution is straightforward, but too slow (TLE).
//
//A better approach is to check the validity of the word square while we build it.
//Example: ["area","lead","wall","lady","ball"]
//We know that the sequence contains 4 words because the length of each word is 4.
//Every word can be the first word of the sequence, let's take "wall" for example.
//Which word could be the second word? Must be a word start with "a" (therefore "area"), because it has to match the second letter of word "wall".
//Which word could be the third word? Must be a word start with "le" (therefore "lead"), because it has to match the third letter of word "wall" and the third letter of word "area".
//What about the last word? Must be a word start with "lad" (therefore "lady"). For the same reason above.
//
//The picture below shows how the prefix are matched while building the sequence.

//https://leetcode.com/problems/word-squares/discuss/91333/Explained.-My-Java-solution-using-Trie-126ms-1616

class Solution {
    func wordSquares(_ words: [String]) -> [[String]] {
        
        guard !words.isEmpty,words[0].count > 0 else {
            return []
        }
        
        let n = words[0].count
        
        let trie = Trie(words)
        var ans: [[String]] = []
        var path: [String] = []
        
        for word in words {
            path.append(word)
            dfs(trie, n, &path, &ans)
            path = []
        }
     
        return ans
    }
    
    func dfs(_ trie:Trie,_ n:Int,_ path: inout [String],_ ans: inout [[String]]){
        if path.count == n {
            ans.append(path)
            return
        }
        
        let index = path.count
        var prefix = ""
        for word in path {
            prefix.append(Array(word)[index])
        }
        
        // Keep in mind each word can be used multiple times
        let candidates = trie.search(by: prefix)
        for word in candidates {
            path.append(word)
            dfs(trie, n, &path, &ans)
            path.removeLast()
        }
    }
}


class TrieNode {
    var words:[String] = []
    var children:[TrieNode?] = Array.init(repeating: nil, count: 26)
}

class Trie {
    public private(set) var root:TrieNode = TrieNode()
    
    init(_ words:[String]){
        for word in words{
           insert(word)
        }
    }
    
    func insert(_ word:String) {
        var curr = root
        for c in word{
            let index = Int(c.unicodeScalars.first!.value) - 97
            if curr.children[index] == nil {
                curr.children[index] = TrieNode()
            }
            curr.children[index]?.words.append(word)
            curr = curr.children[index]!
        }
    }
    
    func search(by prefix: String) -> [String] {
        var curr = self.root
        for c in prefix{
            let index = Int(c.unicodeScalars.first!.value) - 97
            if curr.children[index] == nil {
                return []
            }
            curr = curr.children[index]!
        }
        
        return curr.words
    }
}

