import UIKit

var str = "Hello, playground"

/*Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.

Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.

The order of output does not matter.

Example 1:

Input:
s: "cbaebabacd" p: "abc"

Output:
[0, 6]

Explanation:
The substring with start index = 0 is "cba", which is an anagram of "abc".
The substring with start index = 6 is "bac", which is an anagram of "abc".
Example 2:

Input:
s: "abab" p: "ab"

Output:
[0, 1, 2]

Explanation:
The substring with start index = 0 is "ab", which is an anagram of "ab".
The substring with start index = 1 is "ba", which is an anagram of "ab".
The substring with start index = 2 is "ab", which is an anagram of "ab".
 */

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        
        let s = s.map {letterIndex($0)}
        let p = p.map {letterIndex($0)}
        
        print(s)
        print(p)
        
        // dict for char count in p
        var ref = Array(repeating: 0, count: 26)
        for char in p {
            ref[char] += 1
        }
        
        var result:[Int] = []
        var map = Array(repeating: 0, count: 26)//ref.map{_ in 0}
        
        
        for i in 0..<s.count{
            map[s[i]] += 1
            
            //if right index is greater than total anagram word length, increment the left index by decrementing the first value from map
            if i - p.count >= 0 {
                map[s[i-p.count]] -= 1
            }
            
            // if p and q dict match
            if map == ref {
                result.append(i-p.count+1)
            }
        }
        
        return result
    }
    
    func letterIndex(_ letter:Character) -> Int{
        return Int(letter.unicodeScalars.first!.value) - Int(Unicode.Scalar("a").value)
    }
    
    func findAnagrams1(_ s: String, _ p: String) -> [Int] {
          let s = s.utf8.map { Int($0) }
          let p = p.utf8.map { Int($0) }
          
          var counts = [Int](repeating: 0, count: 128)
          for c in p { counts[c] += 1 }
          
          var start = 0, end = 0, match = 0
          var res = [Int]()
          while end < s.count {
              if counts[s[end]] > 0 { match += 1 }
              counts[s[end]] -= 1
              end += 1

              while match == p.count {
                  if end - start == match { res.append(start) }
                  if counts[s[start]] == 0 { match -= 1 }
                  counts[s[start]] += 1
                  start += 1
              }
          }
          return res
      }
}

var sol = Solution()
sol.findAnagrams("cbaebabacd" ,"abc")
