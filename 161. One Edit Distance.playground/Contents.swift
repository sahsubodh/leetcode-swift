import UIKit

var str = "Hello, playground"

/*Given two strings s and t, determine if they are both one edit distance apart.

Note:

There are 3 possiblities to satisify one edit distance apart:

Insert a character into s to get t
Delete a character from s to get t
Replace a character of s to get t
Example 1:

Input: s = "ab", t = "acb"
Output: true
Explanation: We can insert 'c' into s to get t.
Example 2:

Input: s = "cab", t = "ad"
Output: false
Explanation: We cannot get t from s by only one step.
Example 3:

Input: s = "1203", t = "1213"
Output: true
Explanation: We can replace '0' with '1' to get t.
 */

class Solution {
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        
        let sLen = s.count
        let tLen = t.count
        
        let chars = Array(s)
        let chart = Array(t)
        
        for i in 0..<min(sLen, tLen){
            if (chars[i] != chart[i]) {
                if sLen == tLen { // s has the same length as t, so the only possibility is replacing one char in s and t
                    return chars[(i+1)...] == chart[(i+1)...]
                } else if sLen > tLen { // t is longer than s, so the only possibility is deleting one char from t
                    return chars[(i+1)...] == chart[(i)...]
                } else { // s is longer than t, so the only possibility is deleting one char from s
                    return chars[(i)...] == chart[(i+1)...]
                }
                
            }
            
        }
        
        //All previous chars are the same, the only possibility is deleting the end char in the longer one of s and t
        return abs(sLen-tLen) == 1
    }
}
