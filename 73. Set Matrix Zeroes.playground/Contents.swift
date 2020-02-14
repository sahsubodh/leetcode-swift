import UIKit

var str = "Hello, playground"


/*
 Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.

 Example 1:

 Input:
 [
   [1,1,1],
   [1,0,1],
   [1,1,1]
 ]
 Output:
 [
   [1,0,1],
   [0,0,0],
   [1,0,1]
 ]
 Example 2:

 Input:
 [
   [0,1,2,0],
   [3,4,5,2],
   [1,3,1,5]
 ]
 Output:
 [
   [0,0,0,0],
   [0,4,5,0],
   [0,3,1,0]
 ]
 Follow up:

 A straight forward solution using O(mn) space is probably a bad idea.
 A simple improvement uses O(m + n) space, but still not the best solution.
 Could you devise a constant space solution?
 */


class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        
        var fr:Bool = false
        var fc:Bool = false
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] == 0 {
                    if (i == 0) { fr = true }
                    if (j == 0) { fc = true }
                    matrix[0][j] = 0
                    matrix[i][0] = 0
                }
            }
        }
                
        for i in 1..<matrix.count {
            for j in 1..<matrix[i].count {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
        
        if (fr) {
            for j in 0..<matrix[0].count {
                matrix[0][j] = 0
            }
        }
        
        if (fc) {
            for j in 0..<matrix.count {
                matrix[j][0] = 0
            }
        }
        
    }
}

var input = [[1,1,1],[1,0,1],[1,1,1]]

var sol = Solution()
sol.setZeroes(&input)
