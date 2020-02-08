import UIKit

var str = "Hello, playground"


/*Remove all elements from a linked list of integers that have value val.

Example:

Input:  1->2->6->3->4->5->6, val = 6
Output: 1->2->3->4->5*/




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
    func removeElements1(_ head: ListNode?, _ val: Int) -> ListNode? {
          var currentNode = head
              var prev:ListNode?
              
              var head = head
              
              if head == nil {
                  return head;
              }
              
              while (currentNode?.val) == val {
                  head = head?.next
                  currentNode = head;
              }
              
              while currentNode != nil {
                  if currentNode!.val == val {
                      prev?.next = currentNode?.next
                      currentNode = currentNode?.next

                  } else {
                      prev = currentNode
                      currentNode = currentNode?.next
                  }

              }
              
              return head;
    }
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
       
      var dummy = ListNode(0)
      dummy.next = head
      var curr: ListNode? = dummy
      
      while let value = curr?.next?.val {
        if value == val {
          curr?.next = curr?.next?.next
        }
        else { curr = curr?.next }
      }
      return dummy.next
    }
}
