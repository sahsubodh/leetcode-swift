import UIKit

var str = "Hello, playground"

/*
 Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

Example:

Input: [1,2,3,null,5,null,4]
Output: [1, 3, 4]
Explanation:

   1            <---
 /   \
2     3         <---
 \     \
  5     4       <---
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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        var result:[Int] = []
        var queue:[TreeNode] = []
        
        guard root != nil else {
            return result
        }
        
        queue.append(root!)
        
        while !queue.isEmpty {
            let size = queue.count
            for i in 0..<size{
                let node = queue.removeFirst()

                if (i == size-1){
                    result.append(node.val)
                }
                
                if node.left != nil {
                    queue.append(node.left!)
                }
                
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
        }
        
        return result
    }
}
