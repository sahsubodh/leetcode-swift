import UIKit

var str = "Hello, playground"


/*Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

Example:

Input:
[
  1->4->5,
  1->3->4,
  2->6
]
Output: 1->1->2->3->4->4->5->6
 https://leetcode.com/problems/merge-k-sorted-lists/discuss/264998/Swift-Solution-with-Minimum-Heap

 */

/**
  Definition for singly-linked list. */
 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
         self.val = val
          self.next = nil
      }
  }

class MinimumHeap{
    
    private var heap:[ListNode] = []
    
    func enqueue(_ node:ListNode) {
        heap.append(node)
        var curr = heap.count - 1
        while curr > 0 {
            let parent = (curr - 1)/2
            if heap[parent].val > heap[curr].val {
                heap.swapAt(curr, parent)
                curr = parent
            } else {
                break
            }
        }
    }
    
    func dequeue() -> ListNode?{
        guard heap.count > 0 else { return nil }
        
        let first = heap[0]
        let last = heap.removeLast()
        
        if heap.count > 0 {
            heap[0] = last
            var curr = 0
            while curr < heap.count {
                let next:Int
                let left = curr * 2 + 1 , right = curr * 2 + 2
                if right < heap.count{
                    next = (heap[left].val < heap[right].val ? left :right)
                } else if left < heap.count {
                    next = left
                } else {
                    break
                }
                
                if heap[curr].val > heap[next].val {
                    heap.swapAt(curr, next)
                    curr = next
                } else {
                    break;
                }
                
            }
            
        }
        
        
        return first
    }
}
 

class Heap {
    private var heap:[ListNode] = []
    
    private let comparator:(_ top:ListNode,_ bottom:ListNode) -> Bool
    
    init(topToBottom comparator: @escaping (ListNode, ListNode) -> Bool) {
        self.comparator = comparator
    }
    
    var count : Int {
        return heap.count
    }
    
    func peek() -> ListNode? {
        return heap.first
    }
    
    func enqueue(_ num:ListNode) {
        heap.append(num)
        var curr = count - 1
        while curr > 0 {
            var parent = (curr - 1) / 2
            if !comparator(heap[parent],heap[curr]){
                heap.swapAt(parent, curr)
                curr = parent
            } else {
                break
            }
        }
    }
    
    func dequeue() -> ListNode? {
        guard  count > 0 else {
            return nil
        }
        var result = heap[0]
        let last = heap.removeLast()
        
        if heap.count > 0 {
            heap[0] = last
            var curr = 0
            while curr < heap.count {
                let next: Int
                let left = curr * 2 + 1, right = curr * 2 + 2
                if right < heap.count {
                    next = comparator(heap[left], heap[right]) ? left : right
                } else if left < heap.count {
                    next = left
                } else {
                    break
                }
                
                if !comparator(heap[curr], heap[next]) {
                    heap.swapAt(curr, next)
                    curr = next
                } else {
                    break
                }
            }
        }
            return result
        }
        
}


class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let heap = MinimumHeap()
        
        for list in lists{
            var node = list
            while node != nil {
                heap.enqueue(node!)
                node = node?.next
            }
        }
        
        let lead = ListNode(0)
        var curr = lead
        while let node = heap.dequeue() {
            curr.next = node
            curr = curr.next!
        }
        
        curr.next = nil
        return lead.next
    }
    
    func sorting(node1: ListNode, node2:ListNode) -> Bool {
        return node1.val < node2.val
    }
    
    func mergeKLists1(_ lists: [ListNode?]) -> ListNode? {
        let heap = Heap(topToBottom: sorting)
           
           for list in lists{
               var node = list
               while node != nil {
                   heap.enqueue(node!)
                   node = node?.next
               }
           }
           
           let lead = ListNode(0)
           var curr = lead
           while let node = heap.dequeue() {
               curr.next = node
               curr = curr.next!
           }
           
           curr.next = nil
           return lead.next
       }
    
}
