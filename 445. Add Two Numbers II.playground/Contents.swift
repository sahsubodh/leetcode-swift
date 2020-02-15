import UIKit

var str = "Hello, playground"


/*
 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Follow up:
 What if you cannot modify the input lists? In other words, reversing the lists is not allowed.
 
 Example:
 
 Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 8 -> 0 -> 7
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
        
        var l1 = l1
        var l2 = l2
        
        var stack1:[Int] = []
        var stack2:[Int] = []
        
        while l1 != nil {
                  stack1.append(l1!.val)
                  l1 = l1?.next
              }
              while l2 != nil {
                  stack2.append(l2!.val)
                  l2 = l2?.next
              }
        
        var preHead = ListNode(-1)
        
        var cur = preHead
        
        var sum = 0
        
        while (!stack1.isEmpty || !stack2.isEmpty) {
            
            if !stack1.isEmpty {
                sum += stack1.removeLast()
            }
            
            if !stack2.isEmpty {
                sum += stack2.removeLast()
            }
            
            cur.val = sum % 10
            
            var head = ListNode(sum / 10)
            head.next = cur
            cur = head
            sum = sum / 10
                    
        }
        
        
        return cur.val == -1 ? cur.next : cur
        
    }
}

