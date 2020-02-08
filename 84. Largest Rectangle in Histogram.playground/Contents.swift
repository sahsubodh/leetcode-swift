import UIKit

var str = "Hello, playground"


/*
 Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.

  


 Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].

  


 The largest rectangle is shown in the shaded area, which has area = 10 unit.

  

 Example:

 Input: [2,1,5,6,2,3]
 Output: 10
 
 */


class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
        var heights = heights
        heights.append(0)
        
        var result = 0
        
        var stack = [Int] ()
        
        
        for i in heights.indices{
            
            while (stack.count > 0 && heights[i] <= heights[stack.last!]){
                
            }
            
            
            
            stack.append(i)
        }
        
        
        
 
        
    }
}
