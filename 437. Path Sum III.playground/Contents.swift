import UIKit

var str = "Hello, playground"


/*You are given a binary tree in which each node contains an integer value.

Find the number of paths that sum to a given value.

The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).

The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.

Example:

root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8

      10
     /  \
    5   -3
   / \    \
  3   2   11
 / \   \
3  -2   1

Return 3. The paths that sum to 8 are:

1.  5 -> 3
2.  5 -> 2 -> 1
3. -3 -> 11
 */

/**
 * Definition for a binary tree node. */
  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
      }
  }
 

class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard root != nil else {
            return 0
        }
        
        var dict:[Int:Int] = [:]
        dict[0] = 1
        
        
        return findPathSum(root, 0, sum, dict)
    }
    
    func findPathSum(_ root: TreeNode?, _ sum: Int,_ target:Int,_ dict:[Int:Int]) -> Int {
        
        if root == nil {
            return 0
        }
        var sum = sum
        var dict = dict
        
        // update the prefix sum by adding the current val
        sum += root?.val ?? 0
        
        // get the number of valid path, ended by the current node
        let numPathToCurr = dict[sum-target,default:0]
        
        // update the map with the current sum, so the map is good to be passed to the next recursion
        dict[sum,default:0] += 1
        
        let res  = numPathToCurr + findPathSum(root?.left, sum, target, dict)
                    + findPathSum(root?.right, sum, target, dict)
        
        // restore the map, as the recursion goes from the bottom to the top
        dict[sum,default:0] -= 1

        return res
    }
}



