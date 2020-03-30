import UIKit

var str = "Hello, playground"

/*
 Given the availability time slots arrays slots1 and slots2 of two people and a meeting duration duration, return the earliest time slot that works for both of them and is of duration duration.

 If there is no common time slot that satisfies the requirements, return an empty array.

 The format of a time slot is an array of two elements [start, end] representing an inclusive time range from start to end.

 It is guaranteed that no two availability slots of the same person intersect with each other. That is, for any two time slots [start1, end1] and [start2, end2] of the same person, either start1 > end2 or start2 > end1.

  

 Example 1:

 Input: slots1 = [[10,50],[60,120],[140,210]], slots2 = [[0,15],[60,70]], duration = 8
 Output: [60,68]
 Example 2:

 Input: slots1 = [[10,50],[60,120],[140,210]], slots2 = [[0,15],[60,70]], duration = 12
 Output: []
  

 Constraints:

 1 <= slots1.length, slots2.length <= 10^4
 slots1[i].length, slots2[i].length == 2
 slots1[i][0] < slots1[i][1]
 slots2[i][0] < slots2[i][1]
 0 <= slots1[i][j], slots2[i][j] <= 10^9
 1 <= duration <= 10^6
 */

struct Slot{
    var startTime:Int
    var endTime:Int
}

class Solution {
    
    func sorting(slot1: Slot, slot2:Slot) -> Bool {
        return slot1.startTime < slot2.startTime
    }
    
    
    func minAvailableDuration(_ slots1: [[Int]], _ slots2: [[Int]], _ duration: Int) -> [Int] {
        let heap = Heap(topToBottom: sorting)

        for slot in slots1 {
            if slot[1] - slot[0] >= duration {
                heap.enqueue(Slot(startTime: slot[0], endTime: slot[1]))
            }
        }
        
        for slot in slots2 {
            if slot[1] - slot[0] >= duration {
                heap.enqueue(Slot(startTime: slot[0], endTime: slot[1]))
            }
        }
        
        while (heap.count > 1) {
            if heap.dequeue()!.endTime >= heap.peek()!.startTime + duration {
                return [heap.peek()!.startTime,heap.peek()!.startTime+duration]
            }
        }
        
        return []
    }
}


class Heap {
    
    private var heap:[Slot] = []
    
    private let comparator:(_ top:Slot,_ bottom:Slot) -> Bool
    
    init(topToBottom comparator: @escaping (Slot, Slot) -> Bool) {
        self.comparator = comparator
    }
    
    var count : Int {
        return heap.count
    }
    
    func peek() -> Slot? {
        return heap.first
    }
    
    func enqueue(_ num:Slot) {
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
    
    func dequeue() -> Slot? {
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
