import UIKit

var str = "Hello, playground"

/*
Given a linked list, swap every two adjacent nodes and return its head.

You may not modify the values in the list's nodes, only nodes itself may be changed.

 

Example:

Given 1->2->3->4, you should return the list as 2->1->4->3.*/

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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        if head == nil || head?.next == nil{
            return head
        }
        
        let firstNode = head
        let secondNode = head?.next
        
        
        firstNode?.next = swapPairs(secondNode?.next)
        secondNode?.next = firstNode;
        
        return secondNode;
    }
    
    func swapPairs1(_ head: ListNode?) -> ListNode? {
        
        var head = head
        
        let dummy = ListNode(-1);
        dummy.next = head
        
        var prev = dummy;
        
        while(head != nil && head?.next != nil){
            
            let firstNode = head;
            let secondNode = head?.next;
            
            prev.next = secondNode
            firstNode?.next = secondNode?.next
            secondNode?.next = firstNode
            
            
            prev = firstNode!
            head = firstNode?.next
        }
        
        return dummy.next;
    }
}
