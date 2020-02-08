import UIKit

var str = "Hello, playground"


/*Median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle value.
 
 For example,
 [2,3,4], the median is 3
 
 [2,3], the median is (2 + 3) / 2 = 2.5
 
 Design a data structure that supports the following two operations:
 
 void addNum(int num) - Add a integer number from the data stream to the data structure.
 double findMedian() - Return the median of all elements so far.
 
 
 Example:
 
 addNum(1)
 addNum(2)
 findMedian() -> 1.5
 addNum(3)
 findMedian() -> 2
 
 
 Follow up:
 
 If all integer numbers from the stream are between 0 and 100, how would you optimize it?
 If 99% of all integer numbers from the stream are between 0 and 100, how would you optimize it?
 */



class MedianFinder {
    
    let maxHeap = Heap(topToBottom: >) // left half
    let minHeap = Heap(topToBottom: <) // left half

    /** initialize your data structure here. */
    init() {

    }

    func addNum(_ num: Int) {
        
        if maxHeap.count == 0 || maxHeap.peek()! >= num {
            maxHeap.enqueue(num)
            if maxHeap.count > minHeap.count + 1 {
                minHeap.enqueue(maxHeap.dequeue()!)
            }
        } else {
            minHeap.enqueue(num)
            if maxHeap.count < minHeap.count  {
                maxHeap.enqueue(minHeap.dequeue()!)
            }
        }

    }

    func findMedian() -> Double {
        
        if maxHeap.count != minHeap.count
        {
            return Double(maxHeap.peek()!)
        } else {
            return Double (maxHeap.peek()! + minHeap.peek()!) / 2
        }
    }
}


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

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
