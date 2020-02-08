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
    
    func successor(_ root:TreeNode) -> Int {
        var root = root
        root = root.right!
        while (root.left != nil) {
            root = root.left!
        }
        return root.val
    }
    
    func predecessor(_ root:TreeNode) -> Int {
        var root = root
        root = root.left!
        while (root.right != nil) {
            root = root.right!
        }
        return root.val
    }
    
    func remove(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let node = root else {
            return nil
        }
        
        if node.val == key {
            if node.left == nil && node.right == nil {
                return nil
            }
            if node.left == nil {
                return node.right
            }
            if node.right == nil {
                return node.left
            }
            node.val = node.right!.min.val
            node.right = remove(node.right, node.val)
        } else if key < node.val {
            node.left = remove(node.left, key)
        } else if key > node.val {
            node.right = remove(node.right, key)
        }
        return node
    }
    
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
          return remove(root, key)
      }
    
    func deleteNode1(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        var root = root
        
        if root == nil {
            return root
        }
        
        
        if root!.val > key {
            root?.left = deleteNode(root?.left, key)
        } else if (root!.val < key){
            root?.right = deleteNode(root?.right, key)
        } else {
            if root?.left == nil && root?.right == nil {root = nil}
            
            if root?.right != nil{
                root?.val = successor(root!)
                root?.right = deleteNode(root?.right, root!.val)
            } else {
                root?.val = predecessor(root!)
                root?.left = deleteNode(root?.left, root!.val)
            }
            
        }
        
        return root
    }
}
