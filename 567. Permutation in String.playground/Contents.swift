import UIKit

var str = "Hello, playground"


/*
 Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.

  

 Example 1:

 Input: s1 = "ab" s2 = "eidbaooo"
 Output: True
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:

 Input:s1= "ab" s2 = "eidboaoo"
 Output: False
  

 Note:

 The input strings only contain lower case letters.
 The length of both given strings is in range [1, 10,000].
 */


class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        guard s1.count > 0 && s2.count > 0 && s1.count <= s2.count else {
            return false
        }
        
        let chars1 = s1.map { letterIndex($0) }
        let chars2 = s2.map { letterIndex($0) }

        
        let charlength1 = chars1.count
        let charlength2 = chars2.count
        
        var counts = Array.init(repeating: 0, count: 26)
        
        for i in 0..<charlength1{
            counts[chars1[i]] += 1
            counts[chars2[i]] -= 1
        }
        
        if allZero(counts) {
            return true
        }
        
        for i in charlength1..<charlength2{
            counts[chars2[i]] -= 1
            counts[chars2[i-charlength1]] += 1
            
            if allZero(counts) {
                return true
            }
        }
        
        return false
    }
    
    func letterIndex(_ letter:Character) -> Int {
           return Int(letter.unicodeScalars.first!.value) - Int(Unicode.Scalar("a").value)
    }
    
    func allZero(_ count:[Int]) -> Bool {
        for i in 0..<26{
            if (count[i] != 0) {
                return false
            }
        }
        
        return true
    }
    
}

var sol = Solution()
//sol.checkInclusion("ab", "eidboaoo")
sol.checkInclusion("ab", "ab")
