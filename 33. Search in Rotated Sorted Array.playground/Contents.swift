import UIKit

var str = "Hello, playground"


/*Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

You are given a target value to search. If found in the array return its index, otherwise return -1.

You may assume no duplicate exists in the array.

Your algorithm's runtime complexity must be in the order of O(log n).

Example 1:

Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4
Example 2:

Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
 
 https://leetcode.com/problems/search-in-rotated-sorted-array/discuss/301150/Swift-100-Beats-Logrithmic-Solution.
 */


class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        var low = 0
        var high = nums.count - 1
        
        while (low < high){
            
            let middle = low + (high - low) / 2;
            
            if nums[middle] == target {
                return middle
            }
            
            //first half is not rotated
            if nums[low] <= nums[middle] {
                
                if target >= nums[low] && target < nums[middle] {
                    high = middle - 1
                } else {
                    low = middle + 1
                }
                
            } else {
                if target >= nums[middle] && target <= nums[high] {
                    low = middle + 1
                } else {
                    high = middle - 1
                }

            }
        }
        
        return -1
    }
}
