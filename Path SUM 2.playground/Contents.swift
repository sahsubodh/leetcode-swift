import UIKit

var str = "Hello, playground"


/*Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.

Note: A leaf is a node with no children.

Example:

Given the below binary tree and sum = 22,

      5
     / \
    4   8
   /   / \
  11  13  4
 /  \    / \
7    2  5   1
Return:

[
   [5,4,11,2],
   [5,8,4,5]
]*/

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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        
        var paths:[[Int]] = []
        var currentpath:[Int] = []
        
        guard root != nil else {
            return paths
        }
        
        helper(node:root,sum:sum,paths:&paths,currentpath:&currentpath)
        
        return paths
    }
    
    func helper(node:TreeNode?,sum:Int,paths: inout [[Int]],currentpath: inout [Int]) {
        guard let node = node else {
            return
        }
        
        currentpath.append(node.val)
        
        if (node.val == sum && node.left == nil && node.right == nil){
            paths.append(currentpath)
        } else {
            helper(node: node.left, sum: sum - node.val, paths: &paths, currentpath: &currentpath)
            helper(node: node.right, sum: sum - node.val, paths: &paths, currentpath: &currentpath)
        }
        
        currentpath.removeLast()
    }
}
