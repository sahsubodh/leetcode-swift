import UIKit

var str = "Hello, playground"


/*
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
 Example 1:

 Input:
 matrix = [
   [1,   3,  5,  7],
   [10, 11, 16, 20],
   [23, 30, 34, 50]
 ]
 target = 3
 Output: true
 Example 2:

 Input:
 matrix = [
   [1,   3,  5,  7],
   [10, 11, 16, 20],
   [23, 30, 34, 50]
 ]
 target = 13
 Output: false
 
 */


class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 else {
            return false
        }
        
        guard matrix[0].count > 0 else {
            return false
        }
        
        let m = matrix.count
        let n = matrix[0].count
        
        let length = m * n - 1
        
        var left = 0
        var right = length
        
        
        while (left<=right){
//            print("\(left)  \(right)")
            let pivot = (left + right) / 2;
            let pivotElement = matrix[pivot/n][pivot%n]
            if (target == pivotElement) {
                return true;
            }
            
            if (target>pivotElement){
                left += 1;
            } else {
                right -= 1;
            }
            
        }
        return false;
    }
}

var sol = Solution()

var matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,50]]
var matrix1 = [[1]]
var target = 13

sol.searchMatrix(matrix1, target)
