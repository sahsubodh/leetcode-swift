import UIKit

var str = "Hello, playground"
/*Given a binary tree, determine if it is a valid binary search tree (BST).

Assume a BST is defined as follows:

The left subtree of a node contains only nodes with keys less than the node's key.
The right subtree of a node contains only nodes with keys greater than the node's key.
Both the left and right subtrees must also be binary search trees.
 

Example 1:

    2
   / \
  1   3

Input: [2,1,3]
Output: true
Example 2:

    5
   / \
  1   4
     / \
    3   6

Input: [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.*/


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
 

extension Array where Element : Comparable {
    func isSorted() -> Bool {
        guard self.count > 1 else {
            return true
        }

        for i in 1..<self.count {
            if self[i-1] > self[i] {
                return false
            }
        }
        return true
    }
}


class Solution {

    func isValidBST(_ root: TreeNode?) -> Bool {
        
        return isValidBSTHelper(node: root, min: Int.min, max: Int.max)
    }
    
    func isValidBSTHelper(node: TreeNode?,min:Int,max:Int) -> Bool{
        guard let node = node else {
            return true
        }
        
        let value = node.val

        if value <= min || value >= max {return false}
        

        return isValidBSTHelper(node: node.left, min: min, max: node.val) &&
            isValidBSTHelper(node: node.right, min: node.val, max: max)
    }
    
    var stack:[TreeNode] = []
    
    func isValidBST1(_ root: TreeNode?) -> Bool {
        
        if root == nil {
            return true
        }
        
        var node = root
        
        var pre:TreeNode? = nil
        
        while (!stack.isEmpty || node != nil){
            while (node != nil){
                stack.append(node!)
                node = node?.left
            }
            
            node = stack.removeLast()
            
            if pre != nil && node!.val <= pre!.val {
                return false
            }
            
            pre = node;
            node = node?.right;
        }
        return true
    }
}
