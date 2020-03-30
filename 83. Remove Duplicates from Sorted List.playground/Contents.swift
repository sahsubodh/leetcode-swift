import UIKit

var str = "Hello, playground"

/*
 Given a sorted linked list, delete all duplicates such that each element appear only once.

 Example 1:

 Input: 1->1->2
 Output: 1->2
 Example 2:

 Input: 1->1->2->3->3
 Output: 1->2->3
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



class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        var currentNode = head
        while currentNode != nil && currentNode!.next != nil {
            if currentNode!.val == currentNode!.next!.val {
                currentNode!.next = currentNode!.next!.next
            } else {
                currentNode = currentNode!.next
            }
        }
        
        return head
    }
}
