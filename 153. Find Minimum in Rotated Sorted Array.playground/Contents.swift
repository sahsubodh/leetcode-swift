import UIKit

var str = "Hello, playground"


/*Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

Find the minimum element.

You may assume no duplicate exists in the array.

Example 1:

Input: [3,4,5,1,2]
Output: 1
Example 2:

Input: [4,5,6,7,0,1,2]
Output: 0
 */


class Solution {
    func findMin(_ nums: [Int]) -> Int {
        
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
            } else {
                high = middle 
            }
        }
        return nums[low]
        
    }
}



