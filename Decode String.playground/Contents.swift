import UIKit

/*
Given an encoded string, return its decoded string.

The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

Examples:

s = "3[a]2[bc]", return "aaabcbc".
s = "3[a2[c]]", return "accaccacc".
s = "2[abc]3[cd]ef", return "abcabccdcdcdef".
 **/
var str = "Hello, playground"


class Solution {
    func decodeString(_ s: String) -> String {
        
        let input = Array(s)
        var result = ""
        var characterStack:[String] = []
        var numberStack:[Int] = []
        let length = input.count
        var index:Int = 0
        
        while (index<length){
            if input[index].isNumber {
                var count = 0
                while (input[index].isNumber)
                {
                    count = count * 10 + Int(String(input[index]))!
                    index += 1
                }
                numberStack.append(count)
            } else if input[index] == "["{
                characterStack.append(result)
                result = ""
                index += 1
                
            } else if input[index] == "]"{
                let count = numberStack.removeLast()
                var temp = characterStack.removeLast()
                for i in 0..<count{
                    temp += result;
                }
                result = temp;
                index += 1
            } else {
                result += String(input[index])
                index += 1
            }
        }
        
        return result
    }
}


var sol = Solution()
sol.decodeString("3[a]2[bc]")
