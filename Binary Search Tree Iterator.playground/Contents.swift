import UIKit

var str = "Hello, playground"

/*Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.

Calling next() will return the next smallest number in the BST.

 

Example:



BSTIterator iterator = new BSTIterator(root);
iterator.next();    // return 3
iterator.next();    // return 7
iterator.hasNext(); // return true
iterator.next();    // return 9
iterator.hasNext(); // return true
iterator.next();    // return 15
iterator.hasNext(); // return true
iterator.next();    // return 20
iterator.hasNext(); // return false
 

Note:

next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.
You may assume that next() call will always be valid, that is, there will be at least a next smallest number in the BST when next() is called.*/


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
 

class BSTIterator {

    var stack:[TreeNode] = []
    
    init(_ root: TreeNode?) {
        inorder_left(node: root)
    }
    
    func inorder_left( node:TreeNode?) {
        var node = node
        while (node != nil){
            stack.append(node!)
            node = node?.left
        }
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        let node = stack.removeLast()
        inorder_left(node: node.right)
        return node.val
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return (stack.count > 0)
    }
    
//    func inorder(node:TreeNode){
//        if node != nil{
//            if node.left != nil {
//                inorder(node: node.left!)
//            }
//            stack.append(node.val)
//            if node.right != nil {
//                inorder(node: node.right!)
//            }
//        }
//    }
    

    
//    /** @return the next smallest number */
//    func next() -> Int {
//        if hasNext(){
//            return stack.removeLast()
//        }
//        return -1
//    }

}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
