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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        return isSymmetric(root, root)
    }
    
    func isSymmetric(_ t1: TreeNode?,_ t2: TreeNode?) -> Bool {
        if t1 == nil && t2 == nil {
            return true
        }
        if t1 == nil || t2 == nil {
            return false
        }
        
        return t1!.val == t2!.val && isSymmetric(t1!.left, t2!.left)
            && isSymmetric(t1!.right, t2!.right)
    
    }
    
    func isSymmetric1(_ root: TreeNode?) -> Bool {
        
        if root == nil {
            return true
        }
        
        
        var queue:[TreeNode?] = []
        queue.append(root!)
        queue.append(root!)
        
        while (!queue.isEmpty){
        
            
            let t1 =  queue.removeFirst()
            let t2 =  queue.removeFirst()
            
            if t1 == nil && t2 == nil {
                continue
            }
            
            if t1 == nil || t2 == nil {
                 return false
             }
            
            if t1?.val != t2?.val {
                return false
            }
            
            queue.append(t1?.left)
            queue.append(t2?.right)
            queue.append(t1?.right)
            queue.append(t2?.left)
            
        }
        return true
    }
}
