import UIKit

var str = "Hello, playground"

/*
 Given two binary trees, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

 Example 1:

 Input:     1         1
           / \       / \
          2   3     2   3

         [1,2,3],   [1,2,3]

 Output: true
 Example 2:

 Input:     1         1
           /           \
          2             2

         [1,2],     [1,null,2]

 Output: false
 Example 3:

 Input:     1         1
           / \       / \
          2   1     1   2

         [1,2,1],   [1,1,2]

 Output: false
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        if p == nil && q == nil{
            return true
        }
        
        if p == nil || q == nil{
            return false
        }
        
        if p!.val != q!.val {
            return false
        }
        
        return isSameTree(p!.right, q!.right) &&
            isSameTree(p!.left, q!.left)
    }
    
    
    func isSameTree1(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        var stackP:[TreeNode?] = []
        var stackQ:[TreeNode?] = []
        
        
        
        if p == nil && q == nil{
            return true
        }
        
        if !check(p,q){
            return false
        }
        
        stackP.append(p!)
        stackQ.append(q!)
        
        while (!stackP.isEmpty) {
            let p = stackP.removeLast()
            let q = stackQ.removeLast()
            
            if !check(p!.left,q!.left){
                 return false
             }
            
            if (p?.left != nil){
                stackP.append(p?.left ?? nil)
                stackQ.append(q?.left ?? nil)
            }
            
            if !check(p?.right,q?.right){
                return false
            }
                       
            if (p?.right != nil){
                stackP.append(p?.right ?? nil)
                stackQ.append(q?.right ?? nil)
            }
            
        }
        
        return true
    }
    
    func check(_ p: TreeNode?, _ q: TreeNode?) -> Bool{
        if p == nil && q == nil{
             return true
         }
         
         if p == nil || q == nil{
             return false
         }
         
         if p!.val != q!.val {
             return false
         }
        
        return true
    }
}
