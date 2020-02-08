import UIKit

var str = "Hello, playground"

/*
 
 A message containing letters from A-Z is being encoded to numbers using the following mapping:

 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given a non-empty string containing only digits, determine the total number of ways to decode it.

 Example 1:

 Input: "12"
 Output: 2
 Explanation: It could be decoded as "AB" (1 2) or "L" (12).
 Example 2:

 Input: "226"
 Output: 3
 Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
 
 */


class Solution {
    func numDecodings(_ s: String) -> Int {
        
        let charArray = Array(s)
        let len = charArray.count
        
        guard len > 0 else {
            return 0
        }
        
        var dp:[Int] = Array.init(repeating: 0, count: len+1)
        
        dp[0] = 1
        dp[1] = (charArray[0] == "0") ? 0: 1
        
        for i in 2..<len+1{
            let first = Int(String(charArray[i-1..<i]))
            let second = Int(String(charArray[i-2..<i]))
            
            if (first! >= 1 && first! <= 9) {
                dp[i] += dp[i-1]
            }
            
            if (second! >= 10 && second! <= 26) {
                dp[i] += dp[i-2]
            }
            
        }
        
        return dp[len]
        
        
    }
}


var sol = Solution()
sol.numDecodings("12")
