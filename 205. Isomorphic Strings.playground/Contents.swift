import UIKit

var str = "Hello, playground"


/*Given two strings s and t, determine if they are isomorphic.

Two strings are isomorphic if the characters in s can be replaced to get t.

All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.

Example 1:

Input: s = "egg", t = "add"
Output: true
Example 2:

Input: s = "foo", t = "bar"
Output: false
Example 3:

Input: s = "paper", t = "title"
Output: true
Note:
You may assume both s and t have the same length.
 */

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let length = s.count
        
        var m1:[Int] = Array.init(repeating: -1, count: 256)
        var m2:[Int] = Array.init(repeating: -1, count: 256)
        let charS = Array(s)
        let charT = Array(t)
        
        for i in 0..<length{
            if m1[Int(charS[i].unicodeScalars.first!.value)] != m2[Int(charT[i].unicodeScalars.first!.value)]  {
                return false
            }
            
            
            m1[Int(charS[i].unicodeScalars.first!.value)] = i
            m2[Int(charT[i].unicodeScalars.first!.value)] = i
            
        }
        
        return true
        
    }
}
