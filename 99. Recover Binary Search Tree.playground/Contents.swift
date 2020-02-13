import UIKit

var str = "Hello, playground"

/*
 Two elements of a binary search tree (BST) are swapped by mistake.

 Recover the tree without changing its structure.

 Example 1:

 Input: [1,3,null,null,2]

    1
   /
  3
   \
    2

 Output: [3,1,null,null,2]

    3
   /
  1
   \
    2
 Example 2:

 Input: [3,1,4,null,null,2]

   3
  / \
 1   4
    /
   2

 Output: [2,1,4,null,null,3]

   2
  / \
 1   4
    /
   3
 Follow up:

 A solution using O(n) space is pretty straight forward.
 Could you devise a constant space solution?
 */


/**
  Definition for a binary tree node. */
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
   func recoverTree(_ root: TreeNode?) {
        var last: TreeNode?
        var disorders = [(TreeNode, TreeNode)]()
        traversal(root, &last, &disorders)

        // when we find the first disorder, the bigger one is the wrong one;
        // for the second disorder, the smaller one is the wrong one;
        // if there is only one disorder, the two numbers are both wrong.
        let node1 = disorders.first!.0
        let node2 = disorders.last!.1
        (node1.val, node2.val) = (node2.val, node1.val)
    }
    
    func traversal(_ node: TreeNode?, _ last: inout TreeNode?, _ disorders: inout [(TreeNode, TreeNode)]) {
        guard let node = node else { return }
        
        traversal(node.left, &last, &disorders)
        
        if let last = last, last.val > node.val {
            disorders.append((last, node))
        }
        last = node
        
        traversal(node.right, &last, &disorders)
    }
}
