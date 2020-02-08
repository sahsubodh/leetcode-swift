import UIKit

var str = "Hello, playground"

/*

Given an array A of integers and integer K, return the maximum S such that there exists i < j with A[i] + A[j] = S and S < K. If no i, j exist satisfying this equation, return -1.

 

Example 1:

Input: A = [34,23,1,24,75,33,54,8], K = 60
Output: 58
Explanation:
We can use 34 and 24 to sum 58 which is less than 60.
Example 2:

Input: A = [10,20,30], K = 15
Output: -1
Explanation:
In this case it's not possible to get a pair sum less that 15.


*/

class Solution {
    
    func twoSumLessThanK(_ A: [Int], _ K: Int) -> Int {
        guard A.count > 0 else {
            return -1
        }
        
        var result = -1
        for i in 0..<A.count - 1
        {
            var left = A[i]
            for j in i+1..<A.count where left + A[j] < K{
                var right = A[j]
                result = max(result, left+right)
            }
        }
        
        
        return result
    }
    
    
    //TLE
    func twoSumLessThanK1(_ A: [Int], _ K: Int) -> Int {
        
        var A = A.sorted()
        
        var low = 0
        var high = A.count-1
        var maxnum = Int.min
        
        while (low<high) {
            var sum = A[low] + A[high]
            if sum > K {
                high -= 1
            } else if sum != K {
                maxnum = max(maxnum,sum)
                low += 1
            }
            
        }
        return maxnum
        
    }
}


var sol = Solution()
sol.twoSumLessThanK([34,23,1,24,75,33,54,8], 60)
