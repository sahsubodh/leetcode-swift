import UIKit

var str = "Hello, playground"

/*
 Given a string, find the length of the longest substring without repeating characters.

 Example 1:

 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 https://www.youtube.com/watch?v=3IETreEybaA
 */


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var a_pointer = 0
        var b_pointer = 0
        var maxnum:Int = 0
        
        var charSet:Set<Character> = []
        
        var input = Array(s)
        
        while (b_pointer < input.count){
            if (!charSet.contains(input[b_pointer])) {
                charSet.insert(input[b_pointer])
                b_pointer += 1
                maxnum = max(maxnum, charSet.count)
            } else {
                charSet.remove(input[a_pointer])
                a_pointer += 1
            }
        }
        return maxnum
    }
}

var sol = Solution()

sol.lengthOfLongestSubstring("abcabcbb")
