import UIKit

var str = "Hello, playground"


/*There is a new alien language which uses the latin alphabet. However, the order among letters are unknown to you. You receive a list of non-empty words from the dictionary, where words are sorted lexicographically by the rules of this new language. Derive the order of letters in this language.

Example 1:

Input:
[
  "wrt",
  "wrf",
  "er",
  "ett",
  "rftt"
]

Output: "wertf"
Example 2:

Input:
[
  "z",
  "x"
]

Output: "zx"
Example 3:

Input:
[
  "z",
  "x",
  "z"
]

Output: ""

Explanation: The order is invalid, so return "".
Note:

You may assume all letters are in lowercase.
You may assume that if a is a prefix of b, then a must appear before b in the given dictionary.
If the order is invalid, return an empty string.
There may be multiple valid order of letters, return any one of them is fine.
 */


class Solution {
    func alienOrder(_ words: [String]) -> String {
        
        var result = ""
        
        guard words.count > 0 else {
            return result
        }
        
        
        var map:[Character:Set<Character>] = [:]
        var indegree:[Character:Int] = [:]
        
        for word in words{
            for char in word{
                indegree[char] = 0
            }
        }
        
        
        for i in 0..<words.count - 1 {
            var a_array = Array(words[i])
            var b_array = Array(words[i+1])
            for j in 0..<min(a_array.count, b_array.count){
                var char1 = a_array[j]
                var char2 = b_array[j]
                if char1 == char2 {
                    continue
                }
                
                if map[char1] == nil {
                    map[char1] = Set<Character>()
                }
                
                if !map[char1]!.contains(char2){
                    map[char1]!.insert(char2)
                    indegree[char2] = indegree[char2]! + 1
                }
                
                break
            }
        }
        
        var queue:[Character] = []
        
        for (key,value) in indegree{
            if value == 0
            {
                queue.append(key)
            }
        }
        
        while (!queue.isEmpty){
            var cur = queue.removeFirst()
            result += "\(cur)"
            
            if map[cur] == nil {
                continue
            }
            
            for neighbour in map[cur]!{
                indegree[neighbour]! -= 1
                if (indegree[neighbour] == 0){
                    queue.append(neighbour)
                }
            }
            
        }
        
        if result.count == indegree.count {
            return result
        }
        
        return ""
    }
}
