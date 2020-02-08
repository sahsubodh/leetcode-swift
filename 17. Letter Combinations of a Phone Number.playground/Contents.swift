import UIKit

var str = "Hello, playground"


/*Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.



Example:

Input: "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
Note:

Although the above answer is in lexicographical order, your answer could be in any order you want.

*/


class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0  else {
            return []
        }
        
        let maps: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]

        
        var strings:[String] = []
        for d in digits{
            if let s = maps[d] {
                strings.append(s)
            }
            
        }
        
        var result:[String] = []
        
        backtrack(0, strings, "", &result)
        
        return result
    }
    
    
    func backtrack(_ index:Int,_ strings: [String],_ single_str:String,_ result: inout [String]){
     
        if index == strings.count{
            result.append(single_str)
            return
        }
        
        for c in strings[index]{
            backtrack(index+1, strings, single_str + String(c), &result)
        }
        
    }
    
}
var sol = Solution()
sol.letterCombinations("23")

