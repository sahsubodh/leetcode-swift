import UIKit

var str = "Hello, playground"

/*
 Given a non-empty binary search tree and a target value, find the value in the BST that is closest to the target.

 Note:

 Given target value is a floating point.
 You are guaranteed to have only one unique value in the BST that is closest to the target.
 Example:

 Input: root = [4,2,5,1,3], target = 3.714286

     4
    / \
   2   5
  / \
 1   3

 Output: 4
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
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        
        guard root != nil else {
            return -1
        }
        
        var closest = Double(root!.val)
        
        var root = root
        
        while (root != nil){
            var val = Double(root!.val)
            closest = abs(val-target) < abs(closest-target) ? val : closest
            root = Int(target) < root!.val ? root?.left : root?.right
        }
        
        return Int(closest)
        
    }
}
