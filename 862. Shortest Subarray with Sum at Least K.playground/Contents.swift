import UIKit

var str = "Hello, playground"

/*
 
 Return the length of the shortest, non-empty, contiguous subarray of A with sum at least K.

 If there is no non-empty subarray with sum at least K, return -1.

  

 Example 1:

 Input: A = [1], K = 1
 Output: 1
 Example 2:

 Input: A = [1,2], K = 4
 Output: -1
 Example 3:

 Input: A = [2,-1,2], K = 3
 Output: 3
  

 Note:

 1 <= A.length <= 50000
 -10 ^ 5 <= A[i] <= 10 ^ 5
 1 <= K <= 10 ^ 9
 */


class Solution {
    func shortestSubarray(_ A: [Int], _ K: Int) -> Int {
        let n = A.count
        var result = n + 1
        
        if A.count == 1 && A[0] == K{
            return 1
        }
        
        var b:[Int] = Array.init(repeating: 0, count: result)
        for i in 0..<n {
            b[i+1] = b[i] + A[i]
        }
        
        var deque:[Int] = []
        
        for i in 0..<n {
            while deque.count > 0 && b[i] - b[deque.first!] >= K {
                result = min(result, i - deque.removeFirst())
            }
            
            while deque.count > 0 && b[i] <= b[deque.last!] {
                deque.removeLast()
            }
            
            deque.append(i)
        }
        
        
        return result <= n ? result: -1
    }
}


var sol = Solution()

sol.shortestSubarray([1], 1)
