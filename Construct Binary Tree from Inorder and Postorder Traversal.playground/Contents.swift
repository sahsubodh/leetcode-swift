import UIKit

var str = "Hello, playground"


/*Given inorder and postorder traversal of a tree, construct the binary tree.

Note:
You may assume that duplicates do not exist in the tree.

For example, given

inorder = [9,3,15,20,7]
postorder = [9,15,7,20,3]
Return the following binary tree:

    3
   / \
  9  20
    /  \
   15   7*/


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
    
    var inorder:[Int] = []
    var postorder:[Int] = []
    var preorder:[Int] = []
    var post_index = 0
    var pre_index = 0
    
    var dict:[Int:Int] = [:]
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        
        self.inorder = inorder
        self.postorder = postorder
        
        post_index = postorder.count - 1
        
        for (index,value) in inorder.enumerated(){
            dict[value] = index
        }
        

        return helper(left: 0, right: inorder.count-1)
    }
    
    //post order
    func helper(left:Int,right:Int) -> TreeNode? {
        if (left > right) {
            return nil
        }
        
        
        let rootval = postorder[post_index]
        let root = TreeNode(rootval)
        
        
        post_index -= 1;
        
        let index = dict[rootval]!
        
        root.right = helper(left: index+1, right: right)
        root.left = helper(left: left, right: index-1)
        
        
        return root
    }
    
    //pre order
    func helper1(left:Int, right:Int) -> TreeNode? {
        
        if left == right {
            return nil
        }
        
        let val = preorder[pre_index]
        let root = TreeNode(val)
     
        let inorder_index = dict[val]!
        
        pre_index += 1

        root.right = helper(left: inorder_index + 1 , right: right)
        root.left = helper(left: left  , right: inorder_index)

        return root
    }
    
}


var sol = Solution()
print(sol.buildTree([9,3,15,20,7], [9,15,7,20,3])?.val)

//[9,3,15,20,7]
//[9,15,7,20,3]
