import UIKit

var str = "Hello, playground"

/*
 
 Given a non-empty array of non-negative integers nums, the degree of this array is defined as the maximum frequency of any one of its elements.

 Your task is to find the smallest possible length of a (contiguous) subarray of nums, that has the same degree as nums.

 Example 1:
 Input: [1, 2, 2, 3, 1]
 Output: 2
 Explanation:
 The input array has a degree of 2 because both elements 1 and 2 appear twice.
 Of the subarrays that have the same degree:
 [1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
 The shortest length is 2. So return 2.
 Example 2:
 Input: [1,2,2,3,1,4,2]
 Output: 6
 Note:

 nums.length will be between 1 and 50,000.
 nums[i] will be an integer between 0 and 49,999.
 */


class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        
      var dict: [Int: [Int]] = [:]
        for (i, num) in nums.enumerated() {
            dict[num, default: []].append(i)
        } // O(n)
        
        var degree = 0
        var minLength = 0
        dict.forEach { (element, indices) in
            if indices.count > degree {
                degree = indices.count
                minLength = indices[degree-1] - indices[0] + 1
            } else if indices.count == degree {
                minLength = min(minLength, indices[degree-1] - indices[0] + 1)
            }
        }
        return minLength
        
    }
}
