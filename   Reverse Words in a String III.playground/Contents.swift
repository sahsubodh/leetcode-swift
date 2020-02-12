import UIKit

var str = "Hello, playground"

/*
 Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

 Example 1:
 Input: "Let's take LeetCode contest"
 Output: "s'teL ekat edoCteeL tsetnoc"
 Note: In the string, each word is separated by single space and there will not be any extra space in the string.


 */


class Solution {
    func reverseWords(_ s: String) -> String {
    
        var words = s.split(separator:" ")
        var count = words.count - 1
        
        var result:[String] = []
        
        for word in words {
            var charArray = Array(word)
            result.append(String(reverseWord(charArray)))
        }
        
        
        return result.joined(separator:" ")
    }
    
    func reverseWord(_ charArray:[Character]) -> [Character] {
        
        var start = 0
        var end = charArray.count - 1
        var charArray = charArray
        
        while (start<end) {
            var temp = charArray[start]
            charArray[start] = charArray[end]
            charArray[end] = temp
            start += 1
            end -= 1
        }
        
        return charArray
    }
}


