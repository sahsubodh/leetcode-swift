import UIKit

var str = "Hello, playground"


/*
 Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

 Example 1:
 Input: "aba"
 Output: True
 Example 2:
 Input: "abca"
 Output: True
 Explanation: You could delete the character 'c'.
 Note:
 The string will only contain lowercase characters a-z. The maximum length of the string is 50000.
 */


class Solution {
    func validPalindrome(_ s: String) -> Bool {
        
        var low = 0
        var high = s.count - 1
        
        var input = Array(s)
        
        while (low<high){
            if input[low] != input[high] {
                return isPalindrome(s,low+1,high) ||
                    isPalindrome(s,low,high-1)
            }
            low += 1
            high -= 1
        }
        
        return true
    }
        
    func isPalindrome(_ s: String,_ low:Int,_ high:Int) -> Bool{
        
        var low = low
        var high = high
        var input = Array(s)

        while (low<high){
                
            if input[low] != input[high]{
                return false
            }
                
            low += 1
            high -= 1
        }
    
        return true;
    }
}
