import UIKit

var str = "Hello, playground"


/*You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
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
      func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
      
        var preHead = ListNode(0)
        var p = l1, q = l2, current = preHead
        
        var carry = 0
        while (p != nil || q != nil){
            
            let val1 = p?.val ?? 0
            let val2 = q?.val ?? 0
            
            var sum = val1 + val2 + carry
            
            carry = sum/10
            current.next = ListNode(sum%10)
            current = current.next!
            
            p = p?.next
            q = q?.next
        }
        
        if (carry != 0){
            current.next = ListNode(carry)
        }
        
        return preHead.next
      }

}
