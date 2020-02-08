import UIKit

var str = "Hello, playground"
/*
 Given A, B, C, find any string of maximum length that can be created such that no 3 consecutive characters are same. There can be at max A 'a', B 'b' and C 'c'.

 Example 1:

 Input: A = 1, B = 1, C = 6
 Output: "ccbccacc"
 Example 2:

 Input: A = 1, B = 2, C = 3
 Output: "acbcbc"
 Related questions:

 https://leetcode.com/problems/reorganize-string
 https://leetcode.com/problems/distant-barcodes
 https://leetcode.com/problems/rearrange-string-k-distance-apart (premium)
 */


struct Node{
    var val:Int = 0
    var letter:Character
    
    init(_ letter:Character,_ val:Int = 0) {
        self.letter = letter
        self.val = val
    }
    
}

class Heap {
    
    private var heap:[Node] = []
    
    private let sorting:(_ top:Node,_ bottom:Node) -> Bool
    
    init(_ sorting: @escaping (Node, Node) -> Bool) {
        self.sorting = sorting
    }
    
    var count : Int {
        return heap.count
    }
    
    func peek() -> Node? {
        return heap.first
    }
    
    func enqueue(_ num:Node) {
        heap.append(num)
        var curr = count - 1
        while curr > 0 {
            let parent = (curr - 1) / 2
            if !sorting(heap[parent],heap[curr]){
                heap.swapAt(parent, curr)
                curr = parent
            } else {
                break
            }
        }
    }
    
    func dequeue() -> Node? {
        guard  count > 0 else {
            return nil
        }
        let result = heap[0]
        let last = heap.removeLast()
        
        if heap.count > 0 {
            heap[0] = last
            var curr = 0
            while curr < heap.count {
                let next: Int
                let left = curr * 2 + 1, right = curr * 2 + 2
                if right < heap.count {
                    next = sorting(heap[left], heap[right]) ? left : right
                } else if left < heap.count {
                    next = left
                } else {
                    break
                }
                
                if !sorting(heap[curr], heap[next]) {
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

    
    //max heap
    func sorting(node1: Node, node2:Node) -> Bool {
        return node1.val > node2.val
    }

    func ConsecutiveString(_ lists: [Character:Int]) -> String {
        
        let heap = Heap(sorting)
        
        lists.forEach{ (c, count) in
            let node = Node(c, count)
            heap.enqueue(node)
        }

        var result:[Character] = []
        
        while (heap.count > 0) {
            var first = heap.dequeue()
            
            if (result.count != 0 && result.last == first!.letter) {
                
                if heap.count == 0 {
                    return String(result)
                } else {
                    var second = heap.dequeue()
                    result.append(second!.letter)
                    second!.val -= 1
                    
                    if second!.val != 0 {
                        heap.enqueue(second!)
                    }
                    heap.enqueue(first!)
                }
                
            } else {
                
                let limit = min(2,first!.val)
                for _ in 0..<limit {
                    result.append(first!.letter)
                    first!.val -= 1
                }
                
                if first!.val != 0 {
                    heap.enqueue(first!)
                }
                
            }
        }
        
        return String(result)
    }
    
}


var sol = Solution()

var dict:[Character:Int] = ["a":6,"b":1,"c":1]

print(sol.ConsecutiveString(dict))


var dict1:[Character:Int] = ["a":1,"b":2,"c":3]

print(sol.ConsecutiveString(dict1))

var dict2:[Character:Int] = ["a":0,"b":3,"c":3]

print(sol.ConsecutiveString(dict2))

