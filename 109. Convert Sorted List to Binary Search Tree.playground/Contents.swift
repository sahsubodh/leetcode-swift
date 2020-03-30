import UIKit

var str = "Hello, playground"

/*
 Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

 Example:

 Given the sorted linked list: [-10,-3,0,5,9],

 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

       0
      / \
    -3   9
    /   /
  -10  5
 */



/**
 * Definition for singly-linked list. */
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }
 

/* Definition for a binary tree node. */
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
 

//O(n log n)
class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        
        if head == nil { return nil }
        
        if head?.next == nil { return TreeNode(head!.val) }
        
        var slow = head , pre:ListNode? = nil , fast = head
        
        while (fast != nil && fast!.next != nil) {
            pre = slow
            slow = slow!.next
            fast = fast!.next!.next
        }
        
        pre?.next = nil
        var n = TreeNode(slow!.val)
        n.left = sortedListToBST(head)
        n.right = sortedListToBST(slow!.next)
        return n
    }
}
