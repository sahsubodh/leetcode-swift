import UIKit

var str = "Hello, playground"


/*Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

Example 1:

Input: [3,2,1,5,6,4] and k = 2
Output: 5
Example 2:

Input: [3,2,3,1,2,4,5,5,6] and k = 4
Output: 4
Note:
You may assume k is always valid, 1 ≤ k ≤ array's length.*/


class MinimumHeap{
    
    private var heap:[Int] = []
    
    func enqueue(_ value:Int) {
        heap.append(value)
        var curr = heap.count - 1
        while curr > 0 {
            let parent = (curr - 1)/2
            if heap[parent] > heap[curr] {
                heap.swapAt(curr, parent)
                curr = parent
            } else {
                break
            }
        }
    }
    
    func dequeue() -> Int?{
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
                    next = (heap[left] < heap[right] ? left :right)
                } else if left < heap.count {
                    next = left
                } else {
                    break
                }
                
                if heap[curr] > heap[next] {
                    heap.swapAt(curr, next)
                    curr = next
                } else {
                    break;
                }
                
            }
            
        }
        return first
        
    }
    
    func size() -> Int{
        return heap.count
    }
}
 

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        
        guard nums.count > 0 && nums.count >= k else {
            return -1
        }
        
        let heap = MinimumHeap()
        
        for i in 0..<nums.count{
            heap.enqueue(nums[i])
            if heap.size() > k {
                heap.dequeue()
            }
            
        }
        return heap.dequeue()!
    }
    
    func findKthLargest1(_ nums: [Int], _ k: Int) -> Int {
          
          guard nums.count > 0 && nums.count >= k else {
              return -1
          }
        
        
        return quickSelect(nums, 0, nums.count-1, k)
       
      }
    
    func quickSelect(_ nums: [Int],_ low:Int,_ high: Int,_ k: Int) -> Int{
        var pivot = low
        var nums = nums
        
        // use quick sort's idea
        // put nums that are <= pivot to the left
        // put nums that are  > pivot to the right
        
        for j in low..<high{
            if (nums[j]<=nums[high]){
                nums.swapAt(j, pivot)
                pivot += 1
            }
        }
        nums.swapAt(pivot, high)
        
        var count = high - pivot + 1;
        if count == k {
            return nums[pivot]
        }
        
        if count > k {
            return quickSelect(nums, pivot+1, high, k)
        } else {
            return quickSelect(nums, low, pivot-1, k-count)
        }
    }
}
