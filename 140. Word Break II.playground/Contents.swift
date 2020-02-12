import UIKit

var str = "Hello, playground"


/*
 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences.

Note:

The same word in the dictionary may be reused multiple times in the segmentation.
You may assume the dictionary does not contain duplicate words.
Example 1:

Input:
s = "catsanddog"
wordDict = ["cat", "cats", "and", "sand", "dog"]
Output:
[
  "cats and dog",
  "cat sand dog"
]
Example 2:

Input:
s = "pineapplepenapple"
wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
Output:
[
  "pine apple pen apple",
  "pineapple pen apple",
  "pine applepen apple"
]
Explanation: Note that you are allowed to reuse a dictionary word.
Example 3:

Input:
s = "catsandog"
wordDict = ["cats", "dog", "sand", "and", "cat"]
Output:
[]
 */

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var cache :[String:[String]] = [:]
        
        return dfs(s, wordDict,&cache)
    }
    
    func dfs(_ s:String,_ wordDict: [String],_ cache: inout [String:[String]]) -> [String] {
        
        if s.count == 0 {
            return [""]
        }
        
        if let value = cache[s] {
            return value
        }
        
        var result:[String] = []
        
        for word in wordDict {
            if s.hasPrefix(word) {
                let subWordBreaks = dfs(s.substring(from: word.endIndex), wordDict, &cache)

                for subWordBreak in subWordBreaks{
                    if subWordBreak.isEmpty {
                        result.append(word)
                    } else {
                        result.append(word + " " + subWordBreak)
                    }
                    
                }
            }
        }
        
        return result
    }
}
