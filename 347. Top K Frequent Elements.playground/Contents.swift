import UIKit

var str = "Hello, playground"


/*
 
 Given a non-empty array of integers, return the k most frequent elements.

 Example 1:

 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]
 Note:

 You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 */

class MinimumHeap{
    
    private var heap:[(Int,Int)] = []
    
    func size() -> Int {
        return heap.count
    }
    
    func enqueue(_ node:(Int,Int)) {
        heap.append(node)
        var curr = heap.count - 1
        while curr > 0 {
            let parent = (curr - 1)/2
            if heap[parent].1 > heap[curr].1 {
                heap.swapAt(curr, parent)
                curr = parent
            } else {
                break
            }
        }
    }
    
    func dequeue() -> (Int,Int)?{
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
                    next = (heap[left].1 < heap[right].1 ? left :right)
                } else if left < heap.count {
                    next = left
                } else {
                    break
                }
                
                if heap[curr].1 > heap[next].1 {
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


class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
        var result:[Int] = []

        guard nums.count > 0 else {
            return result
        }
        
        let heap = MinimumHeap()
        var dict:[Int:Int] = [:]
        for num in nums{
            dict[num,default:0] += 1
        }
        
        for (index,value) in dict.enumerated() {
//            print("\(value.key) , \(value.value)")
            heap.enqueue((value.key,value.value))
        }
                
        while heap.size() > k {
            heap.dequeue()
        }
        
        
        while  heap.size() > 0 {
            result.append(heap.dequeue()!.0)
        }
        
//        print(result)
        return result
        
    }
}

var sol = Solution()
sol.topKFrequent([1,1,1,2,2,3], 2)
sol.topKFrequent([1], 1)
