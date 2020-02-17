import UIKit

var str = "Hello, playground"


//https://leetcode.com/problems/trapping-rain-water/

/*
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.


 The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!

 Example:

 Input: [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 */

class Solution {
    func trap(_ height: [Int]) -> Int {
        
        var total_water = 0
           var low = 0
           var high = height.count - 1
           var leftmax = Int.min
           var rightmax = Int.min
           
           
           while (low<high){
               leftmax = max(leftmax,height[low])
               rightmax = max(rightmax,height[high])
               
               if (leftmax < rightmax){
                   total_water += leftmax - height[low]
                   low += 1
               } else {
                   total_water += rightmax - height[high]
                   high -= 1
               }
               
           }
           return total_water
    }
    
}
