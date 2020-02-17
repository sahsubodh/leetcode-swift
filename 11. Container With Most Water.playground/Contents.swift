import UIKit

var str = "Hello, playground"


/*
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

 Note: You may not slant the container and n is at least 2.

  



 The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

  

 Example:

 Input: [1,8,6,2,5,4,8,3,7]
 Output: 49
 */


class Solution {
    func maxArea(_ height: [Int]) -> Int {
        
        var start = 0
        var end = height.count - 1
        var max_area = Int.min
        
        while (start<end) {
            var minHeight = min(height[start],height[end])
            max_area = max(max_area, minHeight * (end - start))
            if height[end] > height[start] {
                start += 1
            } else {
                end -= 1
            }
            
        }
        
        return max_area
    }
    
}
