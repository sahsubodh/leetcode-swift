import UIKit

var str = "Hello, playground"

/*
 Given an unsorted integer array, find the smallest missing positive integer.

 Example 1:

 Input: [1,2,0]
 Output: 3
 Example 2:

 Input: [3,4,-1,1]
 Output: 2
 Example 3:

 Input: [7,8,9,11,12]
 Output: 1
 Note:

 Your algorithm should run in O(n) time and uses constant extra space.
 
 */


class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var length = nums.count
        var nums = nums
        
        // 1. mark numbers (num < 0) and (num > n) with a special marker number (n+1)
         // (we can ignore those because if all number are > n then we'll simply return 1)
        for i in 0..<length{
            if nums[i] <= 0 || nums[i] > length {
                nums[i] = length + 1
            }
        }
        // note: all number in the array are now positive, and on the range 1..n+1
        // 2. mark each cell appearing in the array, by converting the index for that number to negative

        for i in 0..<length {
            var num = abs(nums[i])
            if num > length{
                continue
            }
            
            num -= 1 // -1 for zero index based array (so the number 1 will be at pos 0)
            if nums[num] > 0 {
                nums[num] = -1 * nums[num]
            }
        }
        

        // 3. find the first cell which isn't negative (doesn't appear in the array)
        for i in 0..<length {
            if nums[i] >= 0 {
                return i+1
            }
        }
        
        // 4. no positive numbers were found, which means the array contains all numbers 1..n
        return length + 1
    }
}

var sol = Solution()
sol.firstMissingPositive([1,2,0])
sol.firstMissingPositive([3,4,-1,1])
