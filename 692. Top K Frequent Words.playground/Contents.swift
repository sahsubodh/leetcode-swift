import UIKit

var str = "Hello, playground"


class Solution {
    
    
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var frequency:[String:Int] = [:]
    
        for word in words{
            frequency[word,default:0] += 1
        }
        
        
        return Array(frequency.keys.sorted {
            let freq1 = frequency[$0] ?? 0
            let freq2 = frequency[$1] ?? 0
            if freq1 == freq2 {
                return $0 < $1
            } else {
                return freq1 > freq2
            }
        }.prefix(k))
    }
    
    
    var heap = MaximumHeap()
    //missing lexographic sorting
    func topKFrequent1(_ words: [String], _ k: Int) -> [String] {
        
        var dict:[String:Int] = [:]
        
        var result:[String] = []
        
        for word in words{
            dict[word,default:0] += 1
        }
        
        
        for (key,value) in dict{
            heap.enqueue((key,value))
        }
        
        
        for i in 0..<k{
            result.append(heap.dequeue()!.0)
        }
        return result
        
    }
}


class MaximumHeap{
    
    private var heap:[(String,Int)] = []
    
    func size() -> Int {
        return heap.count
    }
    
    func enqueue(_ node:(String,Int)) {
        heap.append(node)
        var curr = heap.count - 1
        while curr > 0 {
            let parent = (curr - 1)/2
            if heap[parent].1 < heap[curr].1 {
                heap.swapAt(curr, parent)
                curr = parent
            }
            else {
                break
            }
        }
    }
    
    func dequeue() -> (String,Int)?{
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
                    next = (heap[left].1 > heap[right].1 ? left :right)
                } else if left < heap.count {
                    next = left
                } else {
                    break
                }
                
                if heap[curr].1 < heap[next].1 {
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


var sol = Solution()
sol.topKFrequent(["i", "love", "leetcode", "i", "love", "coding"], 2)
