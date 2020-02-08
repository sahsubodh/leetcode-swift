import UIKit

var str = "Hello, playground"


/*Reverse a linked list from position m to n. Do it in one-pass.

Note: 1 ≤ m ≤ n ≤ length of list.

Example:

Input: 1->2->3->4->5->NULL, m = 2, n = 4
Output: 1->4->3->2->5->NULL
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
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        
        guard head != nil, m > 0, n > 0, m <= n else {
               return nil
           }
        
        var m = m
        var n = n
        var head = head
        
        // Move the two pointers until they reach the proper starting point
        // in the list.
        var currentNode = head , prev:ListNode? = nil
        
        while (m>1){
            prev = currentNode
            currentNode = currentNode?.next
            m -= 1
            n -= 1
        }
        
        // The two pointers that will fix the final connections.
        let connection = prev , tail = currentNode
        
        while (n>1){
            var next = currentNode?.next
            currentNode?.next = prev
            prev = currentNode
            currentNode = next
            n -= 1

        }
        
        if connection != nil {
            connection?.next = prev
        } else {
            head = prev
        }
        
        tail?.next = currentNode
        
        return head;
    }
}
