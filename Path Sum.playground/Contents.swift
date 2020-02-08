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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        
        var input = sum;
        guard root != nil else {
            return false
        }
 
        input -= root!.val;
        
        if (root?.left == nil && root?.right == nil) {
            return (input == 0)
        }
        
        return hasPathSum(root?.left, input) || hasPathSum(root?.right, input)
    }
    
    func hasPathSum1(_ root: TreeNode?, _ sum: Int) -> Bool {
        
        guard root != nil else {
            return false
        }
        var stack:[TreeNode] = []
        var sumstack:[Int] = []
        var inputsum = sum
        
        stack.append(root!)
        sumstack.append(inputsum-root!.val)
        
        inputsum -= root!.val
        while (!stack.isEmpty){
            let node = stack.removeLast()
            let remainingsum = sumstack.removeLast()
            
            if node.left == nil && node.right == nil && remainingsum == 0{
                return true
            }
            
            if node.left != nil {
                stack.append(node.left!)
                sumstack.append(remainingsum-node.left!.val)

            }
            
            if node.right != nil {
                stack.append(node.right!)
                sumstack.append(remainingsum-node.right!.val)
            }
        }
        return false
    }
}
