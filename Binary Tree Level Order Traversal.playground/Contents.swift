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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var queue:[TreeNode] = []
        var output:[[Int]] = []
                
        guard let root = root else {
            return output
        }
        
        queue.append(root)
        
        while !queue.isEmpty {
            var size = queue.count
            var inner_list:[Int] = []
            while (size > 0){
                let head = queue.removeFirst()
                inner_list.append(head.val)
                size -= 1
                                
                if let left = head.left {
                    queue.append(left)
                }
                
                if let right = head.right {
                    queue.append(right)
                }
            }
            if (inner_list.count > 0){
                output.append(inner_list)
            }
        }
        
        return output
    }
}


var sol = Solution()

var inputArray = [3,9,20,nil,nil,15,7];

//print(sol.levelOrder(inputArray))





