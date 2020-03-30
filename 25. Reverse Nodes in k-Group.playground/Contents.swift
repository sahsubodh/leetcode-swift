import UIKit

var str = "Hello, playground"

/*
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.

 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.

 Example:

 Given this linked list: 1->2->3->4->5

 For k = 2, you should return: 2->1->4->3->5

 For k = 3, you should return: 3->2->1->4->5

 Note:

 Only constant extra memory is allowed.
 You may not alter the values in the list's nodes, only nodes itself may be changed.
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        if head == nil { return nil }
        if k < 2 {  return head }
        guard let head = head else { return nil }
        
        let dummy = ListNode(0)
        dummy.next = head
        
        var current = dummy
        
        while (current.next != nil) {
            var start = current.next
            var end = current.next
            
            var count = 1
            
            while (count < k && end != nil) {
                end = end!.next
                count += 1
            }
            
            if end == nil {
                break
            }
            
            //next keep track for head of remaing list
            let next = end!.next
            
            //break the chain to reverse the k elements
            end!.next = nil
            
            var tCurr = start
            var prev:ListNode? = nil
            while (tCurr != nil) {
                let tNext = tCurr!.next
                tCurr!.next = prev
                prev = tCurr!
                tCurr = tNext
            }
            
            //after reversing. Put the conenction back
            current.next = end
            
            start!.next = next

            //start next iteration
            current = start!
        }
                
        return dummy.next
    }
}
