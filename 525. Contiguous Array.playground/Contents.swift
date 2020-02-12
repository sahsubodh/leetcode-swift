import UIKit

var str = "Hello, playground"


/*Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.

Example 1:
Input: [0,1]
Output: 2
Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
Example 2:
Input: [0,1,0]
Output: 2
Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
Note: The length of the given binary array will not exceed 50,000.
 */

class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        
        var counter:[Int:Int] = [:]
        
        counter[0] = -1
        
        var maxLen = 0
        var count = 0
        
        for i in 0..<nums.count{
            if nums[i] == 0 {
                count += 1
            } else {
                count -= 1
            }
            
            if counter[count] != nil {
                maxLen = max(maxLen,i-counter[count]!)
            } else {
                counter[count] = i
            }
        }
        
        return maxLen
    }
}
