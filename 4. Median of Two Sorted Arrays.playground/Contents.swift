import UIKit

var str = "Hello, playground"


/*There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 You may assume nums1 and nums2 cannot be both empty.
 
 Example 1:
 
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 Example 2:
 
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 */


class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        guard nums1.count <= nums2.count  else {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        let m = nums1.count, n = nums2.count
        var start = 0, end = m
        
        while start <= end {
            let cutPos1 = (start + end)/2
            let cutPos2 = (m + n + 1)/2 - cutPos1
            
            // If cutPos1 == 0, nothing in array1 is there on the left,
            // use Int.min for maxLeft1
            // If cutPos1 == m, nothing in array1 is there on the right,
            // use Int.max for minRight1
            let maxLeft1 = cutPos1 == 0 ? Int.min : nums1[cutPos1-1]
            let minRight1 = cutPos1 == m ? Int.max : nums1[cutPos1]
            
            let maxLeft2 = cutPos2 == 0 ? Int.min : nums2[cutPos2-1]
            let minRight2 = cutPos2 == n ? Int.max : nums2[cutPos2]
            
            if maxLeft1 <= minRight2, maxLeft2 <= minRight1 {
                // We have partitioned both array at correct place
                if (m + n) % 2 == 0 {
                    return Double(max(maxLeft1, maxLeft2) + min(minRight1, minRight2))/2.0
                } else {
                    return Double(max(maxLeft1, maxLeft2))
                }
            } else if maxLeft1 > minRight2 {
                // We are too far on right side for cutPos1, go left side
                end = cutPos1 - 1
            } else {
                // We are too far on left side for cutPos1, go right side
                start = cutPos1 + 1
            }
        }
        return -1
    }
}

var sol = Solution()
sol.findMedianSortedArrays([1,2], [3,4])
