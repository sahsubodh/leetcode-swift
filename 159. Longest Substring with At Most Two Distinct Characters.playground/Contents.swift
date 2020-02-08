import UIKit

var str = "Hello, playground"


/*
Given a string s , find the length of the longest substring t  that contains at most 2 distinct characters.

Example 1:

Input: "eceba"
Output: 3
Explanation: t is "ece" which its length is 3.
Example 2:

Input: "ccaabbb"
Output: 5
Explanation: t is "aabbb" which its length is 5. */

class Solution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        
        let str_length = s.count;
        
        guard str_length > 2 else {
            return str_length;
        }
        
        var left = 0
        var right = 0
        var maxlength = 0
        var dict:[Character:Int] = [:]
        
        let charArray = Array(s)
        
        
        while (right < str_length){
            
            dict[charArray[right],default:0] += 1
            right += 1
            
            while dict.count > 2 {
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


