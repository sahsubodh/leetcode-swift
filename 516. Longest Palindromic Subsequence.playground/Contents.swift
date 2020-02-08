import UIKit

var str = "Hello, playground"

/*
 
 Given a string s, find the longest palindromic subsequence's length in s. You may assume that the maximum length of s is 1000.

 Example 1:
 Input:

 "bbbab"
 Output:
 4
 One possible longest palindromic subsequence is "bbbb".
 Example 2:
 Input:

 "cbbd"
 Output:
 2
 One possible longest palindromic subsequence is "bb".
 */


class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        var dp:[[Int]] = Array.init(repeating: Array.init(repeating: 0, count: s.count), count: s.count)
        
        var input = Array(s)
        
        for i in stride(from: input.count-1, through: 0, by: -1){
            dp [i][i] = 1
            for j in i+1..<input.count{
                if input[i] == input[j] {
                    dp[i][j] = dp[i+1][j-1] + 2;
                } else {
                    dp[i][j] = max(dp[i+1][j],dp[i][j-1])
                }
            }
        }
        
        return dp[0][input.count-1]
    }
}


var sol = Solution()
sol.longestPalindromeSubseq("bbbab")
