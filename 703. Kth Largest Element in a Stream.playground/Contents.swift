import UIKit

var str = "Hello, playground"

/*
 Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Your KthLargest class will have a constructor which accepts an integer k and an integer array nums, which contains initial elements from the stream. For each call to the method KthLargest.add, return the element representing the kth largest element in the stream.

 Example:

 int k = 3;
 int[] arr = [4,5,8,2];
 KthLargest kthLargest = new KthLargest(3, arr);
 kthLargest.add(3);   // returns 4
 kthLargest.add(5);   // returns 5
 kthLargest.add(10);  // returns 5
 kthLargest.add(9);   // returns 8
 kthLargest.add(4);   // returns 8
 Note:
 You may assume that nums' length ≥ k-1 and k ≥ 1.
 */


struct Heap {
    private var elements = [Int]()
    private var sort: (_ left: Int, _ right: Int) -> Bool
    
    init(elements: [Int],  sort: @escaping (_ left: Int, _ right: Int) -> Bool) {
        self.elements = elements
        self.sort = sort
        
        for index in stride(from: elements.count/2 - 1, through: 0, by: -1) {
            siftDown(at: index)
        }
    }
    
    var peek: Int? {
        return elements.first
    }
    
    var size: Int {
        return elements.count
    }
    
    mutating func push(element: Int) {
        defer {
            siftUp(at: elements.count-1)
        }
        
        elements.append(element)
    }
    
    mutating func pop() -> Int? {
        guard !elements.isEmpty else { return nil }
        
        elements.swapAt(0, elements.count-1)
        defer {
            siftDown(at: 0)
        }
        return elements.removeLast()
    }
    
    private func parent(of index: Int) -> Int { return (index - 1) / 2 }
    private func leftChild(of index: Int) -> Int { return index * 2 + 1}
    private func rightChild(of index: Int) -> Int { return index * 2 + 2 }
    
    private mutating func siftDown(at index: Int) {
        var parent = index
        while true {
            let left = leftChild(of: parent)
            let right = rightChild(of: parent)
            var candidate = parent
            
            if left < elements.count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < elements.count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent {
                return
            }
            
            elements.swapAt(candidate, parent)
            parent = candidate
        }
    }
    
    private mutating func siftUp(at index: Int) {
        var current = index
        var parent = self.parent(of: current)
        
        while current > 0 && sort(elements[current], elements[parent]) {
            elements.swapAt(current, parent)
            current = parent
            parent = self.parent(of: current)
        }
    }
}

class KthLargest {

    /** Brute Solution **/
    
    /*
        [8,5,4,2]
        [8,5,4,3,2]
        [8,5,5,4,3,2]
    
        - Store the kth, sort the given array.
        - add value, sort the array.
        - return the kth element.
    
        Time: O(nlogn)
        Space: O(n)
    */
    
    /** Optimum Solution **/
    
    /*
        - Store the kth element index
        - Store the elements using a max heap
        - Add element to the heap, return kth largest element
    */
    
    var heap: Heap
    let k: Int
    
    init(_ k: Int, _ nums: [Int]) {
        heap = Heap(elements: nums, sort: { $0 < $1 })
        self.k = k
    }
    
    func add(_ val: Int) -> Int {
        heap.push(element: val)
        
        while heap.size > k {
            _ = heap.pop()
        }
        
        return heap.peek ?? 0
    }
}


/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
