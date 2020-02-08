import UIKit

var str = "Hello, playground"


/*Given a singly linked list, determine if it is a palindrome.

Example 1:

Input: 1->2
Output: false
Example 2:

Input: 1->2->2->1
Output: true
Follow up:
Could you do it in O(n) time and O(1) space?
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
    
    
    //doesnt work
 /*
    var frontpointer:ListNode?
    
    func isPalindrome(_ head: ListNode?) -> Bool {
           
        var frontpointer = head;
        return recursiveCheck(head);
    }
    
    func recursiveCheck(_ node:ListNode?)-> Bool{
        
        var node = node;
        while (node != nil) {
           
            if (!recursiveCheck(node?.next)) {
                return false;
            }
            if (node?.val != frontpointer?.val){
                return false;
            }
            frontpointer = frontpointer?.next
        }
        return true
    }
    */
    
    
func isPalindrome(_ head: ListNode?) -> Bool {
    var slow = head, fast = head
    
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    fast = head
    // slow = reverse(slow, nil)
    slow = reverse(slow)
    while slow != nil {
        guard fast?.val == slow?.val else { return false }
        fast = fast?.next
        slow = slow?.next
    }
    return true
}
    
    private func endofFirstHalf(_ head:ListNode?) -> ListNode {
        var slow = head;
        var fast = head;
        
        while (fast != nil){
            slow = slow?.next;
            fast = fast?.next?.next;
        }
        return slow!;
    }
    
    
    
 func reverse(_ head: ListNode?) -> ListNode? {
        
        var currentNode = head
        var prev: ListNode?
        var next: ListNode?
        
        while(currentNode != nil){
            var next = currentNode?.next
            currentNode?.next = prev
            prev = currentNode
            currentNode = next
        }
        
        return prev
    }
    
    
    func isPalindrome1(_ head: ListNode?) -> Bool {
        
        var head1 = reverse(head)
        var currentNode1 = head1
        var currentNode2 = head
        
        while (currentNode1 != nil)
        {
            if (currentNode1?.val != currentNode2?.val)
            {
                return false
            }
            
            currentNode1 = currentNode1?.next
            currentNode2 = currentNode2?.next
        }
        
        guard currentNode1?.next == nil else
        {
            return false
        }
        
        guard currentNode2?.next == nil else
        {
            return false
        }
      
        return true
    }
}
