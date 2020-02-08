import UIKit

var str = "Hello, playground"


/*
 Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.

Note:

The length of both num1 and num2 is < 5100.
Both num1 and num2 contains only digits 0-9.
Both num1 and num2 does not contain any leading zero.
You must not use any built-in BigInteger library or convert the inputs to integer directly.
 */


class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        
        var char1:[Character] = Array(num1)
        var char2:[Character] = Array(num2)
        
        
        var i = char1.count - 1 , j = char2.count - 1
        
        var carry = 0
        var result = ""
        
        while (i >= 0 || j >= 0){
            
            var x:Int = 0
            var y:Int = 0
            if (i >= 0){
                x =  Int (char1[i].unicodeScalars.first!.value) - Int(Unicode.Scalar("0").value)
            }
            
            if (j >= 0){
                y =  Int (char2[j].unicodeScalars.first!.value) - Int(Unicode.Scalar("0").value)
            }
            
            result +=  String((x + y + carry)  % 10)
            carry = (x + y + carry)  / 10
            
            i -= 1
            j -= 1
        }
        
        if (carry != 0) {
            result += String(carry)
        }
        
        return String(result.reversed())
    }
}

var sol = Solution()
sol.addStrings("9", "99")
sol.addStrings("0", "0")
sol.addStrings("98", "9")
