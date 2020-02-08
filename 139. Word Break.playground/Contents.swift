import UIKit

var str = "Hello, playground"

/*Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

Note:

The same word in the dictionary may be reused multiple times in the segmentation.
You may assume the dictionary does not contain duplicate words.
Example 1:

Input: s = "leetcode", wordDict = ["leet", "code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".
Example 2:

Input: s = "applepenapple", wordDict = ["apple", "pen"]
Output: true
Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
             Note that you are allowed to reuse a dictionary word.
Example 3:

Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
Output: false
 */

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var wordDictSet:Set<String> = Set(wordDict)
        
        var dp:[Bool] = Array.init(repeating: false, count: s.count+1)
        dp[0] = true
        
        var charArray = Array(s)
        
        for i in 1...charArray.count{
            for j in 0..<i{
                if (dp[j] && wordDictSet.contains(String(charArray[j..<i]))){
                    dp[i] = true
                    break
                }
            }
            
        }
        
        return dp[s.count]
    }
}


var sol = Solution()
sol.wordBreak("leetcode", ["leet","code"])
