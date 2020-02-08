import UIKit

var str = "Hello, playground"

/*
 You have some sticks with positive integer lengths.

 You can connect any two sticks of lengths X and Y into one stick by paying a cost of X + Y.  You perform this action until there is one stick remaining.

 Return the minimum cost of connecting all the given sticks into one stick in this way.

  

 Example 1:

 Input: sticks = [2,4,3]
 Output: 14
 Example 2:

 Input: sticks = [1,8,3,5]
 Output: 30
  

 Constraints:

 1 <= sticks.length <= 10^4
 1 <= sticks[i] <= 10^4
 */


class Heap {
    private var heap:[Int] = []
    
    private let comparator:(_ top:Int,_ bottom:Int) -> Bool
    
    init(topToBottom comparator: @escaping (Int, Int) -> Bool) {
        self.comparator = comparator
    }
    
    var count : Int {
        return heap.count
    }
    
    func peek() -> Int? {
        return heap.first
    }
    
    func enqueue(_ num:Int) {
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
    
    func dequeue() -> Int? {
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
    
    let minHeap = Heap(topToBottom: <)

    func connectSticks(_ sticks: [Int]) -> Int {
        
        var sum = 0
        for i in 0..<sticks.count {
            minHeap.enqueue(sticks[i])
        }
    
        while minHeap.count > 1 {
            let val1 = minHeap.dequeue()!
            let val2 = minHeap.dequeue()!
            sum += val1 + val2
            minHeap.enqueue(val1 + val2)
        }
        
        return sum
    }
}

var sol = Solution()
sol.connectSticks([2,4,3])
//sol.connectSticks([1,8,3,5])



