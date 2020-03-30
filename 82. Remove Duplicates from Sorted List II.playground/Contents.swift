import UIKit

var str = "Hello, playground"

/*
 Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
 
 Return the linked list sorted as well.
 
 Example 1:
 
 Input: 1->2->3->3->4->4->5
 Output: 1->2->5
 Example 2:
 
 Input: 1->1->1->2->3
 Output: 2->3
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
        
        let dummy = ListNode(0)
        var fast: ListNode? = head
        var slow: ListNode? = dummy
        slow?.next = fast
        
        while fast != nil {
            while fast?.next != nil && fast?.val == fast?.next?.val {
                fast = fast?.next
            }
            if slow?.next !== fast {
                slow?.next = fast?.next
                fast = slow?.next
            } else {
                slow = slow?.next
                fast = fast?.next
            }
        }
        
        return dummy.next
    }
}
