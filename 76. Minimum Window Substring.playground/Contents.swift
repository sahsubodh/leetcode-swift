import UIKit

var str = "Hello, playground"


/*Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

Example:

Input: S = "ADOBECODEBANC", T = "ABC"
Output: "BANC"
Note:

If there is no such window in S that covers all characters in T, return the empty string "".
If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
 */

//this is a two pointer solution
//the worst time cost is O(n+n), so it is still O(n) level
//the solution is:
//always keep fast and slow 2 pointers,  between the area [slow , fast], it should be match all characters in S to contains T
// once we found all required characters in the area, we mark the distance to be minDistance = (fast - slow)
//and then try move slow to next, which mean deleted one matched character on slow side.
//after we delete one required character from left , then we need move fast pointer to right to match this deleted character again, if we matched again and the new distance of area is smaller than previous one, we update the minDistance and index




class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if s.count < t.count {
            return ""
        }
        
        if t.count == 1{
            return s.range(of: t) != nil ? t: ""
        }
        
        var charArray = Array(s)
        var requiredDict = initCharDict(t)
        var map = requiredDict
        var requiredCount = 0
        
        for key in map.keys{
            requiredCount += map[key]!
            map[key] = 0
        }
        
        var slow = 0
        var minDistance = Int.max
        var index = 0
        
        var countOfMatched = 0
        
        for fast in 0..<charArray.count{
            let char = charArray[fast]
            //keep extending the right side to match all required characters in T
            if let cachedCount = map[char] {
                map[char] = cachedCount + 1
                if cachedCount < requiredDict[char]! {
                    countOfMatched += 1
                }
            }
            
            //start triming the left side if matched all required characters in T
              while (countOfMatched == requiredCount && slow < fast) {
                    if (fast - slow) < minDistance {
                        minDistance = fast - slow
                        index = slow
                    }
                    let charAtSlow = charArray[slow]
                    if let cachedCount = map[charAtSlow] {
                        let requiredCharCount = requiredDict[charAtSlow]!
                        map[charAtSlow] = cachedCount - 1
                        if map[charAtSlow]!  < requiredCharCount {
                            countOfMatched -= 1
                        }
                    }
                    slow += 1
                }
            }
        

        if minDistance == Int.max {
            return ""
        }
        
        return String(charArray[index...index+minDistance])
    }
    
    func initCharDict(_ t:String) -> [Character:Int]{
        var map:[Character:Int] = [:]
        
        for ch in t{
            map[ch,default:0] += 1
        }
        
        return map
    }
}


var sol = Solution()
sol.minWindow("ADOBECODEBANC", "ABC")



