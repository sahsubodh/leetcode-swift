import UIKit

var str = "Hello, playground"

/*
 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

 Write a function to determine if a number is strobogrammatic. The number is represented as a string.

 Example 1:

 Input:  "69"
 Output: true
 Example 2:

 Input:  "88"
 Output: true
 Example 3:

 Input:  "962"
 Output: false
 */


class Solution {
    func isStrobogrammatic(_ num: String) -> Bool {
        var dict:[Character:Character] = [:]
        dict["6"] = "9"
        dict["9"] = "6"
        dict["0"] = "0"
        dict["1"] = "1"
        dict["8"] = "8"
        
        var numArr = Array(num)
        
        var start = 0 , end = num.count - 1
        
        while(start<=end) {
            if dict[numArr[start]] == nil {
                return false
            }
            
            if dict[numArr[start]]  != numArr[end]{
                return false
            }
            
            start += 1
            end -= 1
        }
        
        return true
    }
}


var sol = Solution()
sol.isStrobogrammatic("69")
