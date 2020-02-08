import UIKit

var str = "Hello, playground"


/*Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*'.

'?' Matches any single character.
'*' Matches any sequence of characters (including the empty sequence).
The matching should cover the entire input string (not partial).

Note:

s could be empty and contains only lowercase letters a-z.
p could be empty and contains only lowercase letters a-z, and characters like ? or *.
Example 1:

Input:
s = "aa"
p = "a"
Output: false
Explanation: "a" does not match the entire string "aa".
Example 2:

Input:
s = "aa"
p = "*"
Output: true
Explanation: '*' matches any sequence.
Example 3:

Input:
s = "cb"
p = "?a"
Output: false
Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.
Example 4:

Input:
s = "adceb"
p = "*a*b"
Output: true
Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".
Example 5:

Input:
s = "acdcb"
p = "a*c?b"
Output: false*/


class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var s_idx = 0,p_idx = 0, starIdx = -1
        var match = 0
        
        let sArray = Array(s)
        let pArray = Array(p)
        
        while (s_idx < sArray.count){
            
            // advancing both pointers
            if p_idx < pArray.count && (pArray[p_idx] == "?" || pArray[p_idx] == sArray[s_idx]){
                p_idx += 1
                s_idx += 1
            }
                // * found, only advancing pattern pointer
            else if p_idx < pArray.count && pArray[p_idx] == "*"{
                starIdx = p_idx
                match = s_idx
                p_idx += 1
            }
            // last pattern pointer was *, advancing string pointer
            else if starIdx != -1 {
                p_idx = starIdx + 1
                match += 1
                s_idx = match
            }
            //current pattern pointer is not star, last pattern pointer was not *
            //characters do not match
            else {
                return false
            }
            
        }

        //check for remaining characters in pattern
        while (p_idx < pArray.count && pArray[p_idx] == "*"){
            p_idx += 1
        }
        
        return p_idx == pArray.count
    }
}

var sol = Solution()
sol.isMatch("aa", "a")
