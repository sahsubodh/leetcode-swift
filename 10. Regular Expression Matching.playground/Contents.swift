import UIKit

var str = "Hello, playground"


/*Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.
 
 '.' Matches any single character.
 '*' Matches zero or more of the preceding element.
 The matching should cover the entire input string (not partial).
 
 Note:
 
 s could be empty and contains only lowercase letters a-z.
 p could be empty and contains only lowercase letters a-z, and characters like . or *.
 Example 1:
 
 Input:
 s = "aa"
 p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:
 
 Input:
 s = "aa"
 p = "a*"
 Output: true
 Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
 Example 3:
 
 Input:
 s = "ab"
 p = ".*"
 Output: true
 Explanation: ".*" means "zero or more (*) of any character (.)".
 Example 4:
 
 Input:
 s = "aab"
 p = "c*a*b"
 Output: true
 Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
 Example 5:
 
 Input:
 s = "mississippi"
 p = "mis*is*p*."
 Output: false*/

//https://www.youtube.com/watch?v=l3hda49XcDE
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        
        var rows = s.count + 1
        var cols = p.count + 1
        
        var result:[[Bool]] = Array(repeating:Array(repeating:false, count: cols), count:rows)
        
        result[0][0] = true
        
        for i in 1..<cols
        {
            if p[i - 1] == "*"
            {
                result[0][i] = result [0][i - 2]
                
            }
        }
        
        for i in 1..<rows
        {
            for j in 1..<cols
            {
                if s[i - 1] == p[j - 1] || p[j - 1] == "."
                {
                    result[i][j] = result[i - 1][j - 1]
                }
                else if p[j - 1] == "*"
                {
                    result[i][j] = result[i][j - 2]
                    if s[i - 1] == p[j - 2] || p[j - 2] == "."
                    {
                        result[i][j] = result[i][j] || result[i - 1][j]
                        //result[i][j] = result[i][j - 1]
                    }
                    
                }
            }
        }
        return result[rows - 1][cols - 1]
    }
}


extension String
{
    subscript(index:Int) -> Character
    {
        let index = self.index(self.startIndex, offsetBy:index, limitedBy:self.endIndex)
        return self[index!]
    }
    
}
