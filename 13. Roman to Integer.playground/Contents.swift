import UIKit

var str = "Hello, playground"

/*Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9.
X can be placed before L (50) and C (100) to make 40 and 90.
C can be placed before D (500) and M (1000) to make 400 and 900.
Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.
 
 Example 1:

 Input: "III"
 Output: 3
 Example 2:

 Input: "IV"
 Output: 4
 Example 3:

 Input: "IX"
 Output: 9
 Example 4:

 Input: "LVIII"
 Output: 58
 Explanation: L = 50, V= 5, III = 3.
 Example 5:

 Input: "MCMXCIV"
 Output: 1994
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 
 */


class Solution {
    func romanToInt(_ s: String) -> Int {
        
        let charArray = Array(s)
        
        var num:[Int] = Array.init(repeating: 0, count: charArray.count)
        
        for i in 0..<charArray.count {
            switch charArray[i] {
            case "M": num[i] = 1000;
            case "D": num[i] = 500;
            case "C": num[i] = 100;
            case "L": num[i] = 50;
            case "X": num[i] = 10;
            case "V": num[i] = 5;
            case "I": num[i] = 1;
            default: break;
            }
        }
            var result = 0
            for i in 0..<num.count-1{
                if (num[i] < num[i+1]){
                    result -= num[i]
                } else {
                    result += num[i]
                }
                
            }
     
        return result + num[num.count-1]
    }
}

