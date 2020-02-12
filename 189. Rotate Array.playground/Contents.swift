import UIKit

var str = "Hello, playground"

/*Given an array, rotate the array to the right by k steps, where k is non-negative.

Example 1:

Input: [1,2,3,4,5,6,7] and k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]
Example 2:

Input: [-1,-100,3,99] and k = 2
Output: [3,99,-1,-100]
Explanation:
rotate 1 steps to the right: [99,-1,-100,3]
rotate 2 steps to the right: [3,99,-1,-100]
Note:

Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
Could you do it in-place with O(1) extra space?
 */


class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var k = k % nums.count
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, k - 1)
        reverse(&nums, k, nums.count - 1)
    }
    
    func reverse(_ nums:inout [Int], _ start:Int,_ end:Int) {
        var start = start
        var end = end
        while (start < end) {
            var temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start += 1
            end -= 1
        }
    }
    
    func rotate1(_ nums: inout [Int], _ k: Int) {
                   
           if nums.count < 2 || k < 1
           {
                  
           } else {
               
               var reverse_nums = Array(repeating: 0, count: nums.count)

               for i in 0...nums.count-1{
                   reverse_nums[(i+k)%nums.count] = nums[i]
               }
               nums = reverse_nums
           
           }
       }
    
}


