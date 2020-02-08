import UIKit

var str = "Hello, playground"

/*Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

Example 1:

Input: 121
Output: true
Example 2:

Input: -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
Example 3:

Input: 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 */

class Solution {
    
    func isPalindrome(_ x: Int) -> Bool {
        var number = x
        var reverseNumber = 0
        while number > 0 {
            let reminder = number % 10
            reverseNumber = reverseNumber * 10 + reminder
            number = number / 10
        }
        return x == reverseNumber
    }
    
    func isPalindrome1(_ x: Int) -> Bool {
        
        let input = String(x)
        
        let inputArray = Array(input)
        
        var low = 0
        var high = input.count - 1
        
        while (low < high){
            if inputArray[low] != inputArray[high] {
                return false;
            }
            low += 1
            high -= 1
        }
        
        return true
        
    }
}
