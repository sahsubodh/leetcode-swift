import UIKit

var str = "Hello, playground"


/*
 Given a binary tree, flatten it to a linked list in-place.
 
 For example, given the following tree:
 
 1
 / \
 2   5
 / \   \
 3   4   6
 The flattened tree should look like:
 
 1
 \
 2
 \
 3
 \
 4
 \
 5
 \
 6
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
    
    var prev:TreeNode? = nil
    
    func flatten1(_ root: TreeNode?) {
        
        guard let root = root else {
            return
        }
        
        flatten(root.right)
        flatten(root.left)
        root.right = prev
        root.left = nil
        
        prev = root
    }
    
    func flatten(_ root: TreeNode?) {
        flatten(root,nil)
    }
    
    func flatten(_ root: TreeNode?,_ prev:TreeNode?) -> TreeNode? {
        
        var prev = prev
        
        if root == nil {
            return prev
        }
        
        prev = flatten(root?.right,prev)
        prev = flatten(root?.left,prev)
        root?.right = prev
        root?.left = nil
        prev = root
        return prev
    }
}
