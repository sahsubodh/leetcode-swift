import UIKit

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
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else {
            return nil
        }
        
        return helper(nums, 0, nums.count-1)
    }
    
    func helper(_ nums: [Int],_ left: Int,_ right: Int) -> TreeNode?{
        if left > right {
            return nil
        }
        
        let middle = right + left / 2
        
        let root = TreeNode(nums[middle])
        
        root.left = helper(nums, left,  middle-1)
        root.right = helper(nums, middle+1, right)
        
        return root;
        
    }
}
