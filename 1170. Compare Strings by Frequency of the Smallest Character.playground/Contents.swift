import UIKit

var str = "Hello, playground"

/*
 Let's define a function f(s) over a non-empty string s, which calculates the frequency of the smallest character in s. For example, if s = "dcce" then f(s) = 2 because the smallest character is "c" and its frequency is 2.

 Now, given string arrays queries and words, return an integer array answer, where each answer[i] is the number of words such that f(queries[i]) < f(W), where W is a word in words.

  

 Example 1:

 Input: queries = ["cbd"], words = ["zaaaz"]
 Output: [1]
 Explanation: On the first query we have f("cbd") = 1, f("zaaaz") = 3 so f("cbd") < f("zaaaz").
 Example 2:

 Input: queries = ["bbb","cc"], words = ["a","aa","aaa","aaaa"]
 Output: [1,2]
 Explanation: On the first query only f("bbb") < f("aaaa"). On the second query both f("aaa") and f("aaaa") are both > f("cc").
  

 Constraints:

 1 <= queries.length <= 2000
 1 <= words.length <= 2000
 1 <= queries[i].length, words[i].length <= 10
 queries[i][j], words[i][j] are English lowercase letters.
 */


class Solution {
    func numSmallerByFrequency(_ queries: [String], _ words: [String]) -> [Int] {
        
        // This arr's index represents frequency, and its value represents how many Strings in "words" array have same or more frequency
        // For example, words = ["a","aa","aaa","aaaa"], arr[1]=4,  arr[2]=3,  arr[3]=2,  arr[4]=1
        var frequencies = Array.init(repeating: 0, count: 11)  // <= I first used 11 as well and got ArrayIndexOutOfBound error
        
        for word in words {
            frequencies[getMinFreq(word)] += 1
        }
        
        // Fill accumulated values from backward
        for i in stride(from: frequencies.count - 2, to: 0, by: -1){
            frequencies[i] += frequencies[i+1]
        }
        
        
        var result = Array.init(repeating: 0, count: queries.count)
        
        for i in 0..<queries.count {
            let index = getMinFreq(queries[i])
            if index < 10 {
                result[i] = frequencies[index+1]  //  O(1) access to get the number of words with more frequencies 
            }
        }
        
        return result
    }
    
    private func getMinFreq(_ s:String) -> Int {
        var result = 0
        var check: Character = "z"
        
        for char in s {
            if char < check {
                result = 1
                check = char
            } else if char == check {
                result += 1
            }
        }
        return result
    }
    
}
