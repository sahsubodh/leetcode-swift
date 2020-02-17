import UIKit

var str = "Hello, playground"


/*In some array arr, the values were in arithmetic progression: the values arr[i+1] - arr[i] are all equal for every 0 <= i < arr.length - 1.

Then, a value from arr was removed that was not the first or last value in the array.

Return the removed value.

 

Example 1:

Input: arr = [5,7,11,13]
Output: 9
Explanation: The previous array was [5,7,9,11,13].
Example 2:

Input: arr = [15,13,12]
Output: 14
Explanation: The previous array was [15,14,13,12].
 

Constraints:

3 <= arr.length <= 1000
0 <= arr[i] <= 10^5
 */


class Solution {
    func missingNumber(_ arr: [Int]) -> Int {

        var n = arr.count
        
        var diff = arr[n - 1] - arr[0] / n
        
        var left = 0, right = n - 1
        
        while (left<right) {
            var mid = (left + right) / 2
            if arr[mid] == arr[0] + diff * mid {
                left = mid + 1
            } else {
                right = mid
            }
            
        }

        return arr[0] + diff * left
    }
}

var sol = Solution()
sol.missingNumber([5,7,11,13])
