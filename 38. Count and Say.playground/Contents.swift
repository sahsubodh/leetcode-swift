import UIKit

var str = "Hello, playground"

/*
 The count-and-say sequence is the sequence of integers with the first five terms as following:

 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 1 is read off as "one 1" or 11.
 11 is read off as "two 1s" or 21.
 21 is read off as "one 2, then one 1" or 1211.

 Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence. You can do so recursively, in other words from the previous member read off the digits, counting the number of digits in groups of the same digit.

 Note: Each term of the sequence of integers will be represented as a string.

  

 Example 1:

 Input: 1
 Output: "1"
 Explanation: This is the base case.
 Example 2:

 Input: 4
 Output: "1211"
 Explanation: For n = 3 the term was "21" in which we have two groups "2" and "1", "2" can be read as "12" which means frequency = 1 and value = 2, the same way "1" is read as "11", so the answer is the concatenation of "12" and "11" which is "1211".
 */

/*

You start with "1" as the first line.

Each subsequent line (n) is generated by passing the line before it (n - 1) as an input to a somewhat unusual function (I'll explain as brute-force for illustrative purposes):

Loop through the line (n - 1) as a string. For a given character, count how many consecutive times it repeats, then put that on line n followed by the number.

For example:

If you have "1", the next line is "11".
If you have "11", the next line is "21".
If you have "111", the next line is "31".
If you have "1111", the next line is "41".
See the basic pattern? Just do that for every set of repeating characters on the previous line.
Here's what it looks like with more than one sequence:

If you have "11222", the next line is "2132" ("11" becomes "21" and "222" becomes "32").
If you have "112225", the next line is "213215" ("11" becomes "21", "222" becomes "32", and "5" becomes "15").
*/


//https://leetcode.com/problems/count-and-say/discuss/16047/Swift-Solution-29ms-(90)

class Solution {
    func countAndSay(_ n: Int) -> String {
        
        if n == 1 {
            return "1"
        }
        
        var currentTerm = "1"
        var nextTerm = ""
        var count = 0
        var char:Character = currentTerm.first!
        
        for i in 2...n{
            nextTerm = ""
            count = 0
            char = currentTerm.first!
            
            for currentChar in currentTerm {
                if currentChar == char {
                    count += 1
                } else {
                    nextTerm += "\(count)\(char)"
                    char = currentChar
                    count = 1
                }
                
            }
            
            nextTerm += "\(count)\(char)"
            currentTerm = nextTerm
        }

        
        return currentTerm
    }
}

