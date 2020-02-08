import UIKit

var str = "Hello, playground"


/*Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.

Example 1:

Input: 123
Output: "One Hundred Twenty Three"
Example 2:

Input: 12345
Output: "Twelve Thousand Three Hundred Forty Five"
Example 3:

Input: 1234567
Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
Example 4:

Input: 1234567891
Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
 
 https://leetcode.com/problems/integer-to-english-words/discuss/157688/A-little-bit-length-but-100-Swift-solution
*/


class Solution {
    func numberToWords(_ num: Int) -> String {
        
        if num == 0 { return "Zero" }
        
        let unitAry = ["", " Thousand", " Million", " Billion"]
        var numAry:[Int] = []
        
        var current = num
        while (current > 0){
            numAry.append(current%1000)
            current /= 1000
        }
        var res = ""
        for i in 0..<numAry.count {
            if (numAry[i] == 0) { continue }
            res = threedigit(numAry[i]) + unitAry[i] + res
            
        }
        
        if Array(res).first == Character(" "){
            res.remove(at: res.startIndex)
        }
        
        return res
    }
    
    
    private func threedigit(_ num:Int) -> String {
        var res = ""
        var digit = num/100 // get number for hundred
        res += onedigit(digit) + (digit == 0 ? "": " Hundred")
        digit = num%100 // get two digit
        res += twodigit(digit)
        return res
    }
    
    private func twodigit(_ num:Int) -> String {
        let d2 = num/10
        let d1 = num%10
        if d2 == 0 {return onedigit(d1)}
        var res = ""
        if d2 > 1 {
            switch d2 {
                case 2: res = " Twenty"
                case 3: res = " Thirty"
                case 4: res = " Forty"
                case 5: res = " Fifty"
                case 6: res = " Sixty"
                case 7: res = " Seventy"
                case 8: res = " Eighty"
                case 9: res = " Ninety"
                default: res = ""
            }
            return res + onedigit(d1)
        }
        
        switch num {
            case 10: return " Ten"
            case 11: return " Eleven"
            case 12: return " Twelve"
            case 13: return " Thirteen"
            case 14: return " Fourteen"
            case 15: return " Fifteen"
            case 16: return " Sixteen"
            case 17: return " Seventeen"
            case 18: return " Eighteen"
            case 19: return " Nineteen"
            default: return ""
        }
    }
    
    private func onedigit(_ num:Int) -> String {
        switch num {
            case 1: return " One"
            case 2: return " Two"
            case 3: return " Three"
            case 4: return " Four"
            case 5: return " Five"
            case 6: return " Six"
            case 7: return " Seven"
            case 8: return " Eight"
            case 9: return " Nine"
            default: return ""
        }
    }
    
}
