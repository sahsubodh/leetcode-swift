import UIKit

var str = "Hello, playground"


/*
 Return the root node of a binary search tree that matches the given preorder traversal.

 (Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)

  

 Example 1:

 Input: [8,5,1,7,10,12]
 Output: [8,5,10,1,7,null,12]

  

 Note:

 1 <= preorder.length <= 100
 The values of preorder are distinct.
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
    
    var i = 0
    
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 else {
            return nil
        }
        
        return bstFromPreorder(preorder, Int.max)
    }
    
    private func bstFromPreorder(_ preorder:[Int],_ bound:Int) -> TreeNode? {
        if preorder.count == i || preorder[i] > bound {
            return nil
        }
        
        var root = TreeNode(preorder[i])
        i += 1
        root.left = bstFromPreorder(preorder, root.val)
        root.right = bstFromPreorder(preorder, bound)
        return root
    }
}

