import UIKit

var str = "Hello, playground"

/*Given a non-empty array of digits representing a non-negative integer, plus one to the integer.

The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.

You may assume the integer does not contain any leading zero, except the number 0 itself.

Example 1:

Input: [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
Example 2:

Input: [4,3,2,1]
Output: [4,3,2,2]
Explanation: The array represents the integer 4321.
 */


class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        
            var resultArr = Array(digits.reversed());
//        print(type(of: digits.reversed()))
//    print(resultArr)
    for (index,value) in resultArr.enumerated()
    {
//        type(of: resultArr)
//        print("\(index), \(value)");
        if (value < 9)
        {
            resultArr[index] = value+1;
            return resultArr.reversed();
        }
        resultArr[index] = 0;
    }
    resultArr.append(1);
    
  return resultArr.reversed();

        
    }
}

var sol = Solution()
sol.plusOne([1,2,3])
