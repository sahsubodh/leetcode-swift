import UIKit

var str = "Hello, playground"

/*
 Given a string s and an int k, return all unique substrings of s of size k with k distinct characters.

 Example 1:

 Input: s = "abcabc", k = 3
 Output: ["abc", "bca", "cab"]
 Example 2:

 Input: s = "abacab", k = 3
 Output: ["bac", "cab"]
 Example 3:

 Input: s = "awaglknagawunagwkwagl", k = 4
 Output: ["wagl", "aglk", "glkn", "lkna", "knag", "gawu", "awun", "wuna", "unag", "nagw", "agwk", "kwag"]
 Explanation:
 Substrings in order are: "wagl", "aglk", "glkn", "lkna", "knag", "gawu", "awun", "wuna", "unag", "nagw", "agwk", "kwag", "wagl"
 "wagl" is repeated twice, but is included in the output once.
 Constraints:

 The input string consists of only lowercase English letters [a-z]
 0 ≤ k ≤ 26
 */

func kSubString(_ str:String,_ k:Int) -> [String] {
    
    let charArray = Array(str)
    var result:Set<String> = []
    
    var window:Set<Character> = []
    
    var start = 0 , end = 0
    
    while (end < charArray.count) {
        
        // remove duplicates
        while (window.contains(charArray[end])) {
            window.remove(charArray[start])
            start += 1
        }
        
        //insert new character
        window.insert(charArray[end])
        
        // window size is k , add to result
        if window.count == k {
            result.insert(String(charArray[start...end]))
            window.remove(charArray[start])
            start += 1
        }
        
        
        end += 1
    }
    
    //convert set to array
    return Array(result)
}

var s = "abcabc", k = 3
var s1 = "abacab", k1 = 3
var s2 = "awaglknagawunagwkwagl", k2 = 4

kSubString(s,k)
kSubString(s1,k1)
print(kSubString(s2,k2))

