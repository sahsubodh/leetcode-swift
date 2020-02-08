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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var stack:[TreeNode] = []
        var output:[Int] = []
        
        var currentNode = root
        
        while (currentNode != nil || !stack.isEmpty){
            if (currentNode != nil){
                stack.append(currentNode!)
                currentNode = currentNode?.left
            } else{
                var head = stack.removeLast()
                output.append(head.val)
                currentNode = currentNode?.right
            }
        }
        return output
    }
    
}
