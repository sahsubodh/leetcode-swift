import UIKit

var str = "Hello, playground"


/*Given two strings text1 and text2, return the length of their longest common subsequence.

A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.

 

If there is no common subsequence, return 0.

 

Example 1:

Input: text1 = "abcde", text2 = "ace"
Output: 3
Explanation: The longest common subsequence is "ace" and its length is 3.
Example 2:

Input: text1 = "abc", text2 = "abc"
Output: 3
Explanation: The longest common subsequence is "abc" and its length is 3.
Example 3:

Input: text1 = "abc", text2 = "def"
Output: 0
Explanation: There is no such common subsequence, so the result is 0.
 

Constraints:

1 <= text1.length <= 1000
1 <= text2.length <= 1000
The input strings consist of lowercase English characters only.*/


class Solution {
    
    
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        
        if text1.count == 0 || text2.count == 0 { return 0 }

        var dp:[[Int]] = Array.init(repeating: Array.init(repeating: 0, count: text2.count+1), count: text1.count+1)

        let m = text1.count
        let n  = text2.count
        
        let charArray1 = Array(text1)
        let charArray2 = Array(text2)
        
        for i in 0...m{
            for j in 0...n {
                if i == 0 || j == 0 {
                    dp[i][j] = 0;
                } else if charArray1[i-1] == charArray2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        return dp[m][n];
    }
    
    
    
     
//     doesnt work
     
    func longestCommonSubsequence1(_ text1: String, _ text2: String) -> Int {
        var dp:[[Int]] = Array.init(repeating: Array.init(repeating: 0, count: text2.count+1), count: text1.count+1)

        let charArray1 = Array(text1)
        let charArray2 = Array(text2)
        
        return lcsm_recursive(charArray1,charArray2,charArray1.count,charArray2.count,&dp);
    }
    
    func lcsm_recursive(_ text1: [Character], _ text2: [Character],_ i:Int,_ j:Int,_ dp:inout [[Int]]) -> Int{
   
        var i = i
        var j = j
    
        if (i<=0 || j<=0) {
            return 0
        }
        
        if dp[i][j] != 0 {
            return dp[i][j]
        }
        
        if (text1[i] == text1[j]) {
            return 1 +  lcsm_recursive(text1,text2,i-1,j-1,&dp)
        } else {
           
            dp[i][j] = max(lcsm_recursive(text1,text2,i-1,j,&dp), lcsm_recursive(text1,text2,i,j-1,&dp))
            
            return dp[i][j]
        }
    }
}


var sol = Solution()
sol.longestCommonSubsequence("abcde", "ace")
