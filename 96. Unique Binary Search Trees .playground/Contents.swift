import UIKit

var str = "Hello, playground"


/*Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?

Example:

Input: 3
Output: 5
Explanation:
Given n = 3, there are a total of 5 unique BST's:

   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3
 */


class Solution {
    func numTrees(_ n: Int) -> Int {
        
//        if n <= 1 { return 1 }
//
//
//        var result:[Int] = Array.init(repeating:0,count:n+1)
//
//         result[0] = 1
//         result[1] = 1
//
//
//         for i in 2...n {
//                 for j in 1...i {
//                     result[i] += result[j - 1] * result[i - j]
//                 }
//             }
//
//         return result[n]
        
        if n <= 1 { return 1 }
               
               var result:[Int] = Array.init(repeating:0,count:n+1)
               result[0] = 1
               result[1] = 1
               for i in 2...n {
                   result[i] = 0
                   for j in 1...i {
                       result[i] += result[j - 1] * result[i - j]
                   }
               }
               
               return result[n]
        
    }
}
