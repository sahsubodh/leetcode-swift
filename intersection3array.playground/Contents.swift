import UIKit

var str = "Hello, playground"

/*Given three integer arrays arr1, arr2 and arr3 sorted in strictly increasing order, return a sorted array of only the integers that appeared in all three arrays.

 

Example 1:

Input: arr1 = [1,2,3,4,5], arr2 = [1,2,5,7,9], arr3 = [1,3,4,5,8]
Output: [1,5]
Explanation: Only 1 and 5 appeared in the three arrays.
 
 */


class Solution {
    func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        
        var resultArray:[Int] = [];
        
        var i = 0;
        var j = 0;
        var k = 0;
        
        while (i < arr1.count && j < arr2.count && k < arr3.count )
        {
            if (arr1[i] == arr2[j] && arr2[j] == arr3[k])
            {
                resultArray.append(arr1[i]);
                i += 1;
                j += 1;
                k += 1;
            } else if (arr1[i] < arr2[j]) {
                i += 1;
            } else if (arr2[j] < arr3[k]) {
                j += 1;
            } else {
                k += 1;
            }
        }
        
        return resultArray
    }
}


var sol = Solution();
sol.arraysIntersection([1,2,3,4,5], [1,2,5,7,9], [1,3,4,5,8])
