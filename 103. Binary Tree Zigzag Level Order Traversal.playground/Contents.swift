import UIKit

var str = "Hello, playground"

/*
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its zigzag level order traversal as:
 [
   [3],
   [20,9],
   [15,7]
 ]
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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        
        var queue:[TreeNode] = []
        var result:[[Int]] = []
        
        if root == nil {
            return result
        }
        
        var direction = true
        queue.append(root!)
        
        while (!queue.isEmpty) {
            var size = queue.count
            var level:[Int] = []
            while (size > 0){
                let node = queue.removeFirst()
                if direction {
                    level.append(node.val)
                } else {
                    level.insert(node.val, at: 0)
                }
                
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
                
                size -= 1
            }
            
            result.append(level)
            direction = !direction
        }
        
        return result
    }
}
