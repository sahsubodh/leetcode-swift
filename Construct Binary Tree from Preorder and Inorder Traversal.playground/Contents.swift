import UIKit

var str = "Hello, playground"

/*
 Given preorder and inorder traversal of a tree, construct the binary tree.

 Note:
 You may assume that duplicates do not exist in the tree.

 For example, given

 preorder = [3,9,20,15,7]
 inorder = [9,3,15,20,7]
 Return the following binary tree:

     3
    / \
   9  20
     /  \
    15   7

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
    
    var pre_indx = 0
    var preorder: [Int] = []
    var inorder: [Int] = []
    var dict:[Int:Int] = [:]
    
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        self.preorder = preorder
        self.inorder = inorder
        
        for (index,value) in inorder.enumerated(){
            dict[value] = index;
        }
        return helper(left: 0, right: inorder.count)
    }
    
    func helper(left:Int, right:Int) -> TreeNode? {
        
        if left == right {
            return nil
        }
        
        let val = preorder[pre_indx]
        let root = TreeNode(val)
     
        let inorder_index = dict[val]!
        
        pre_indx += 1
        
        root.left = helper(left: left  , right: inorder_index)
        root.right = helper(left: inorder_index + 1 , right: right)
        

        return root
    }
    
    
    func buildTree1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        guard let root_value = preorder.first else {
            return nil
        }
        
        let root = TreeNode(root_value)
       
        let i = inorder.firstIndex(of: root_value)!
        
        let inorder_left = Array(inorder[0..<i])
        let inorder_right = Array(inorder[i+1..<inorder.count])
        let preorder_left = Array(preorder[1..<i+1])
        let preorder_right = Array(preorder[i+1..<preorder.count])
        
        root.left = buildTree1(preorder_left,inorder_left)
        root.right = buildTree1(preorder_right,inorder_right)
        
        return root
     }
    
}


var sol = Solution()
print(sol.buildTree1([3,9,20,15,7],[9,3,15,20,7])?.val)

print(sol.buildTree([3,9,20,15,7],[9,3,15,20,7])?.val)
