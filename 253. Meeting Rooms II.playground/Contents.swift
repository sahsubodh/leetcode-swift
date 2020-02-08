import UIKit

var str = "Hello, playground"


/*
 Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.

 Example 1:

 Input: [[0, 30],[5, 10],[15, 20]]
 Output: 2
 Example 2:

 Input: [[7,10],[2,4]]
 Output: 1
 NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 
 */


class Solution {
    
    
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
           
        guard intervals.count > 0 else {
            return 0
        }
        
        var start:[Int] = []
        var end:[Int] = []
        
        for i in 0..<intervals.count{
            start.append(intervals[i][0])
            end.append(intervals[i][1])
        }
        
        
        start.sort()
        end.sort()
        
        var usedRooms = 0
        
        var startTime = 0, endTime = 0
        
        while(startTime<intervals.count) {
            
            if (start[startTime] >= end[endTime]) {
                usedRooms -= 1
                endTime += 1
                
            }
            
            
            usedRooms += 1
            startTime += 1
        }
        
        return usedRooms
       }
       
}

var sol = Solution()
sol.minMeetingRooms([[0, 30],[5, 10],[15, 20]])
//sol.minMeetingRooms([[7,10],[2,4]])

//sol.minMeetingRooms([[1,5],[8,9],[8,9]])

//sol.minMeetingRooms([[1293,2986],[848,3846],[4284,5907],[4466,4781],[518,2918],[300,5870]])
    
/*
    var heap = MinimumHeap()
    
    func minMeetingRooms1(_ intervals: [[Int]]) -> Int {
        
        guard intervals.count > 0 else {
            return 0
        }
        
        // Sort the intervals by start time
        let currentArray = intervals.sorted(by: { $0[0] < $1[0]})
        
        print(currentArray)
        heap.enqueue(currentArray[0])
        print(currentArray[0])
        
        for i in 1..<currentArray.count {
//
//            var interval = heap.peek()
//
//            if (currentArray[i][0] >= interval![1]) {
//                heap.dequeue()
//            }
//
//            heap.enqueue(currentArray[i])
            // get the meeting room that finishes earliest
            var interval = heap.dequeue()
            if (currentArray[i][0] >= interval![1]){
                // dequeue and enqueue to update timestamp start end - will fail in equal time intervals
                interval![1] = currentArray[i][1]
            } else {
                // otherwise, this meeting needs a new room
                heap.enqueue(currentArray[i])
            }
            heap.enqueue(interval!)
        }
        
        
        return heap.size()
    }
}


// Use a min heap to track the minimum end time of merged intervals
class MinimumHeap {
    
    private var heap:[[Int]] = []
    
    func size() -> Int {
        return heap.count
    }
    
    func peek() -> [Int]? {
        if size() > 0 {
            return heap[0]
        }
        return []
     }
    
    
    func enqueue(_ value:[Int]) {
        heap.append(value)
        var curr = heap.count - 1
        while (curr > 0) {
            let parent = (curr - 1) / 2
            if heap[parent][1] >= heap[curr][1] {
                heap.swapAt(parent, curr)
                curr = parent
            } else {
                break
            }
        }
    }
    
    func dequeue() -> [Int]? {
        guard heap.count > 0 else {
            return []
        }
        
        let first = heap[0]
        let last = heap.removeLast()
        
        var curr = 0
        
        while (curr<heap.count) {
            heap[0] = last
            let next:Int
            let left = curr * 2 + 1, right = curr * 2 + 2
            if right < heap.count{
                next = (heap[left][1] < heap[right][1] ? left:right)
            } else if left < heap.count {
                next = left
            } else {
                break
            }
            
            if heap[curr][1] >= heap[next][1] {
                heap.swapAt(curr, next)
                curr = next
            } else {
                break
            }
            
        }
        
        return first
    }
    
    
}
*/


