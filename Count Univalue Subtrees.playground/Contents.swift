import UIKit

/*Given a binary tree, count the number of uni-value subtrees.

A Uni-value subtree means all nodes of the subtree have the same value.

Example :

Input:  root = [5,1,5,5,5,null,5]

              5
             / \
            1   5
           / \   \
          5   5   5

Output: 4
 */

var str = "Hello, playground"


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
    
    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        var count = 0
        guard root != nil else {
            return count
        }
        
        isvalidpart(node: root, count: &count)
        
        return count
    }
    
    func isvalidpart(node:TreeNode? ,count: inout Int,parent unival:Int? = nil) -> Bool{
        
        guard let node = node else {
            return true
        }
    
           let isUni = (
            lhs: isvalidpart(node: node.left, count: &count, parent: node.val),
            rhs: isvalidpart(node: node.right, count: &count, parent: node.val)
        )
        guard isUni.lhs, isUni.rhs else { return false }
        
        count += 1;
        return node.val == unival
    }
    
    
    func isUnivalTree(_ root: TreeNode?) -> Bool {
    
        return isUnivalTreeHelper(root,value: root?.val)
    }
    
    func isUnivalTreeHelper(_ root: TreeNode?,value:Int?) -> Bool{
        if root == nil  {
            return true
        }
        
        if value != root?.val { return false }
        return isUnivalTreeHelper(root?.left,value: value) && isUnivalTreeHelper(root?.right,value: value)
    }
}


/*
A binary tree is univalued if every node in the tree has the same value.

Return true if and only if the given tree is univalued. */
