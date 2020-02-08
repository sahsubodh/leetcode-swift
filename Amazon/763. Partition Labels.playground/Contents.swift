import UIKit

var str = "Hello, playground"

/*A string S of lowercase letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.

Example 1:
Input: S = "ababcbacadefegdehijhklij"
Output: [9,7,8]
Explanation:
The partition is "ababcbaca", "defegde", "hijhklij".
This is a partition so that each letter appears in at most one part.
A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.
Note:

S will have length in range [1, 500].
S will consist of lowercase letters ('a' to 'z') only.
 */

//https://www.youtube.com/watch?v=5NCjHqx2v-k

class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        
        var result:[Int] = []
        
        if S.count == 0 {
            return result
        }
        
        let sArray = Array(S)
        
        var last_indices:[Int] = Array.init(repeating: 0, count: 26)
        
        for i in 0..<sArray.count {
            last_indices[Int(sArray[i].unicodeScalars.first!.value) - 97] = i
        }
        
        var start = 0, end = 0
        
        for i in 0..<sArray.count{
            end = max(end, last_indices[Int(sArray[i].unicodeScalars.first!.value) - 97])
            if i == end {
                result.append(end-start+1)
                start = end + 1
            }
        }
        
        return result
        
    }
}


var sol = Solution()
sol.partitionLabels("ababcbacadefegdehijhklij")
