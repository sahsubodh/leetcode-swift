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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack:[TreeNode] = []
        
        var node = root
        var index = k
        
        while (!stack.isEmpty || node != nil){
            while (node != nil){
                stack.append(node!)
                node = node?.left
            }
            
            node = stack.removeLast()
            
            index -= 1;
            if (index==0) { break; }
            
            node = node?.right
        }
        return node!.val
    }
    
}
