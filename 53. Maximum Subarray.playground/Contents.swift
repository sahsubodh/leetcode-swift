import UIKit

var str = "Hello, playground"


/*Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

Example:

Input: [-2,1,-3,4,-1,2,1,-5,4],
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
Follow up:

If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 
 DP video : https://www.youtube.com/watch?v=2MmGzdiKR9Y
 
 */



class Solution {
    
    //Kadane Algo
    func maxSubArray(_ nums: [Int]) -> Int {
        
        guard nums.count > 1 else {
                 return nums[0]
             }
             
             
             var maxSoFar = nums[0]
             var maxTillHere = nums[0]
             
             
             for i in 1..<nums.count{
                 
                 maxTillHere = max(maxTillHere+nums[i], nums[i])
                 
                 maxSoFar = max(maxSoFar, maxTillHere)
             }
             
             return maxSoFar
    }
}
