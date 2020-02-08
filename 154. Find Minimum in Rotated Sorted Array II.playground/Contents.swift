import UIKit

var str = "Hello, playground"

/*Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

Find the minimum element.

The array may contain duplicates.

Example 1:

Input: [1,3,5]
Output: 1
Example 2:

Input: [2,2,2,0,1]
Output: 0
Note:

This is a follow up problem to Find Minimum in Rotated Sorted Array.
Would allow duplicates affect the run-time complexity? How and why?
 */


class Solution {
    
    func findMin(_ nums: [Int]) -> Int {
       if nums.count == 1 { return nums[0] }
       var left = 0
       var right = nums.count - 1
       while left < right {
         let middle = left + (right - left)/2
         if nums[middle] > nums[right] {
           left = middle + 1
         }
         else if nums[middle] < nums[left] {
           right = middle
           left += 1
         }
         else {
           right -= 1
         }
       }
       return nums[left]
     }
    
    
    func findMin1(_ nums: [Int]) -> Int {
        if nums.count == 0 {
        return -1
    }
    
    var high = nums.count - 1
    var low = 0
    var middle = 0
    
    while (low<high){
        middle = low + (high - low) / 2
        
        if nums[middle] > nums[high]{
            low = middle + 1
        } else if nums[middle] < nums[high] {
            high = middle
        } else {
            high -= 1;
        }
    }
    return nums[low]
    }
}
