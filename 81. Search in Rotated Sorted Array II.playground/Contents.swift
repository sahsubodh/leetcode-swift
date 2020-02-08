import UIKit

var str = "Hello, playground"


/*Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., [0,0,1,2,2,5,6] might become [2,5,6,0,0,1,2]).

You are given a target value to search. If found in the array return true, otherwise return false.

Example 1:

Input: nums = [2,5,6,0,0,1,2], target = 0
Output: true
Example 2:

Input: nums = [2,5,6,0,0,1,2], target = 3
Output: false
Follow up:

This is a follow up problem to Search in Rotated Sorted Array, where nums may contain duplicates.
Would this affect the run-time complexity? How and why?
 */


class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var low = 0
         var high = nums.count - 1
         
         while (low < high){
             
             let middle = low + (high - low) / 2;
             
             if nums[middle] == target {
                 return true
             }
             
             //first half is not rotated
             if nums[low] < nums[middle] {
                 
                 if target >= nums[low] && target < nums[middle] {
                     high = middle - 1
                 } else {
                     low = middle + 1
                 }
                 
             } else if  nums[low] > nums[middle] {
                 if target >= nums[middle] && target <= nums[high] {
                     low = middle + 1
                 } else {
                     high = middle - 1
                 }

             } else {
                low += 1
            }
         }
         
         return false
    }
}
