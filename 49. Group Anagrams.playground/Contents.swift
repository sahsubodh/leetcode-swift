import UIKit

var str = "Hello, playground"


/*
 Given an array of strings, group anagrams together.

Example:

Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
Output:
[
  ["ate","eat","tea"],
  ["nat","tan"],
  ["bat"]
]
Note:

All inputs will be in lowercase.
The order of your output does not matter.
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        guard strs.count > 0 else {
            return [[]]
        }
        
        var map:[String:[String]] = [:]
        
        for str in strs{
            
            var count = Array.init(repeating: 0, count: 26)

            var charArray = Array(str)
            
            for i in 0..<charArray.count{
                count[Int(charArray[i].unicodeScalars.first!.value - Unicode.Scalar("a").value)] += 1
            }
            
            var key = ""
            for c in count{
                key += String(c)
            }
             
            map[key,default: []] += [str];
            
        }
    
        
        return Array(map.values)
    }
}

var sol = Solution()
sol.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
