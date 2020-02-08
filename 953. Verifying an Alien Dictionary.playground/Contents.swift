import UIKit

var str = "Hello, playground"

/*
 
 In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

 Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.

  

 Example 1:

 Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
 Output: true
 Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
 Example 2:

 Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
 Output: false
 Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
 Example 3:

 Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
 Output: false
 Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
  

 Constraints:

 1 <= words.length <= 100
 1 <= words[i].length <= 20
 order.length == 26
 All characters in words[i] and order are English lowercase letters.
 
 https://leetcode.com/problems/verifying-an-alien-dictionary/discuss/263363/Swift-24ms-100
 */


class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dict:[Character:Int] = [:]
        
//        var orderArr = Array(order)
        
        for i in 0..<order.count{
//            let char = orderArr[i]
            let char = order[order.index(order.startIndex, offsetBy: i)]
            dict[char] = i
        }
        
        for i in 0..<words.count - 1{
            let wordA = words[i]
            let wordB = words[i+1]
            var compared = false
            for j in 0..<min(wordA.count, wordB.count){
                let charA = wordA[wordA.index(wordA.startIndex, offsetBy: j)]
                let charB = wordB[wordB.index(wordB.startIndex, offsetBy: j)]
                let mapA = dict[charA]!
                let mapB = dict[charB]!
                
                // check the previous letter is not bigger
                if mapA > mapB {
                    return false
                } else if mapA < mapB {
                    compared = true
                    break
                }
            }
            
            // check word count for similar types of words
            if !compared {
                if wordA.count > wordB.count {
                    return false
                }
            }
        }
        return true
    }
}

var sol = Solution()
sol.isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz")

