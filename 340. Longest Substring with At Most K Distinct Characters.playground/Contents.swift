import UIKit

var str = "Hello, playground"

/*Given a string, find the length of the longest substring T that contains at most k distinct characters.

Example 1:

Input: s = "eceba", k = 2
Output: 3
Explanation: T is "ece" which its length is 3.
Example 2:

Input: s = "aa", k = 1
Output: 2
Explanation: T is "aa" which its length is 2.*/


class Solution {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
         let str_length = s.count;
        
        guard str_length*k > 0 else {
            return 0
        }
        
        var left = 0
        var right = 0
        var maxlength = 0
        var dict:[Character:Int] = [:]
        
        let charArray = Array(s)
        
        
        while (right < str_length){
            
            dict[charArray[right],default:0] += 1
            right += 1
            
            while dict.count > k {
                dict[charArray[left]]! -= 1
                if (dict[charArray[left]]) == 0 {
                    dict[charArray[left]] = nil
                }
                left += 1
            }
            
            maxlength = max(maxlength,right-left)
        }
        
        return maxlength
        
    }
}
