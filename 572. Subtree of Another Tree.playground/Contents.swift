import UIKit

var str = "Hello, playground"

/*
 
 Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.

 Example 1:
 Given tree s:

      3
     / \
    4   5
   / \
  1   2
 Given tree t:
    4
   / \
  1   2
 Return true, because t has the same structure and node values with a subtree of s.
 Example 2:
 Given tree s:

      3
     / \
    4   5
   / \
  1   2
     /
    0
 Given tree t:
    4
   / \
  1   2

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
    
  func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
       if t == nil { return true }
       if s == nil { return false }
       if isIdentical(first: s, second: t) { return true }
       return isSubtree(s?.left, t) ||
               isSubtree(s?.right, t)
   }
   
   private func isIdentical(first: TreeNode?, second: TreeNode?) -> Bool {
       if first == nil, second == nil { return true }
       if first == nil || second == nil { return false }
       
       if first?.val == second?.val,
           isIdentical(first: first?.left, second: second?.left),
           isIdentical(first: first?.right, second: second?.right) {
           return true
       }
       return false
   }
    
    /*
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        return traverse(s, t)
    }
    
    func traverse(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        return s != nil && isEqual(s, t) || isEqual(s?.left, t) || isEqual(s?.right, t)
    }
    
    func isEqual(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        
        if s == nil && t == nil {
            return true
        }
        
        if s == nil || t == nil {
            return false
        }
        return s!.val == t!.val && isEqual(s?.left, t?.left) && isEqual(s?.right, t?.right)
    }
    */
}
