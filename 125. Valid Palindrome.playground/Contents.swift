import UIKit

var str = "Hello, playground"


/*
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Note: For the purpose of this problem, we define empty string as valid palindrome.

 Example 1:

 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:

 Input: "race a car"
 Output: false
 */


class Solution {
func isPalindrome(_ s: String) -> Bool {

    if s.isEmpty || s.count > 0 {
        return true
    }
    
    let undesiredChars = CharacterSet.alphanumerics.inverted
    let input = s.components(separatedBy: undesiredChars).joined(separator: "").lowercased()
    
    let inputArray = Array(input)
    var start = 0
    var end = inputArray.count - 1
    
    while (start < end){
        
        if inputArray[start] != inputArray[end] {
            return false
        }
        
        start += 1
        end -= 1
        
    }
    
    return true
}
}
