import UIKit

var str = "Hello, playground"
/*
 Given a string S, check if the letters can be rearranged so that two characters that are adjacent to each other are not the same.

If possible, output any possible result.  If not possible, return the empty string.

Example 1:

Input: S = "aab"
Output: "aba"
Example 2:

Input: S = "aaab"
Output: ""
Note:

S will consist of lowercase letters and have length in range [1, 500].
 */


//No Sort O(N):
//
//count letter appearance and store in hash[i]
//find the letter with largest occurence.
//put the letter into even index numbe (0, 2, 4 ...) char array
//put the rest into the array


class Solution {
    func reorganizeString(_ S: String) -> String {
        
       var dict: [Character: Int] = [:]
        let S = Array(S)
        let n = S.count
        
        var maxFreq = 0
        var maxChar: Character = " "
        for c in S {
            dict[c, default: 0] += 1
            if dict[c]! > maxFreq {
                maxFreq = dict[c]!
                maxChar = c
            }
            guard dict[c]! <= (n + 1) / 2 else { return "" }
        }
        
        var ans: [Character] = Array(repeating: " ", count: n)
        
        // Put the most frequent char into the ans array
        var i = 0
        for _ in 1...maxFreq {
            ans[i] = maxChar
            i += 2
        }
        
        dict.removeValue(forKey: maxChar)
        dict.forEach { (c, count) in
            for _ in 1...count {
                // if the current index >= n, return to index 1 (after the most frequent char)
                // This will happen once and only once
                if i >= n {
                    i = 1
                }
                
                ans[i] = c
                i += 2
            }
        }
        
        return String(ans)
    }
}
    

