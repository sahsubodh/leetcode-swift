import UIKit

var str = "Hello, playground"

/*
 
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its bottom-up level order traversal as:
 [
   [15,7],
   [9,20],
   [3]
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [[Int]]() }
        
        var ans = [[Int]]()
        var queue = [root]
        
        while !queue.isEmpty {
            var sub = [Int]()
            let count = queue.count
            
            for _ in 0..<count {
                let curr = queue.removeFirst()
                sub.append(curr.val)
                
                if let left = curr.left {
                    queue.append(left)
                }
                
                if let right = curr.right {
                    queue.append(right)
                }
            }
            ans.insert(sub, at: 0)
        }
        
        return ans
        
    }
}
