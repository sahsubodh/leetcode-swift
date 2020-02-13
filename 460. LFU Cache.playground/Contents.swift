import UIKit

var str = "Hello, playground"


/*
 Design and implement a data structure for Least Frequently Used (LFU) cache. It should support the following operations: get and put.

 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 put(key, value) - Set or insert the value if the key is not already present. When the cache reaches its capacity, it should invalidate the least frequently used item before inserting a new item. For the purpose of this problem, when there is a tie (i.e., two or more keys that have the same frequency), the least recently used key would be evicted.

 Note that the number of times an item is used is the number of calls to the get and put functions for that item since it was inserted. This number is set to zero when the item is removed.

  

 Follow up:
 Could you do both operations in O(1) time complexity?

  

 Example:

 LFUCache cache = new LFUCache( 2 /* capacity */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.get(3);       // returns 3.
 cache.put(4, 4);    // evicts key 1.
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4
 */

class CacheNode{
    let key:Int
    var value:Int
    var prev:CacheNode?
    var next:CacheNode?
    var count = 1
    
    init(_ key:Int,_ value:Int ) {
        self.key = key
        self.value = value
    }
}
    
class CacheList {
    private let head = CacheNode(0, 0)
    private let tail = CacheNode(0, 0)
    private var count = 0
    
    var isEmpty : Bool{
        return count <= 0
    }
    
    
    init(){
        head.next = tail
        tail.prev = head
    }
    
    func add(_ node: CacheNode) {
        head.next?.prev = node
        node.next = head.next
        node.prev = head
        head.next = node
        count += 1
    }
    
    func remove(_ node:CacheNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        node.prev = nil
        node.next = nil
        count -= 1
    }
    
    
    func removeLast() -> CacheNode? {
        guard !isEmpty , let node = tail.prev else {
            return nil
        }
        remove(node)
        return node
    }
}



class LFUCache {
    
    private let capacity:Int
    private var nodeMap = [Int:CacheNode]()
    private var freqListMap = [Int:CacheList]()
    private var size = 0
    private var leastFrequency = 1
    

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = nodeMap[key], let list = freqListMap[node.count] else {
            return -1
        }
        
        updateExists(node: node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if capacity == 0 {
            return
        }
        
        if let node = nodeMap[key], let list = freqListMap[node.count] {
            node.value = value
            updateExists(node: node)
        } else {
            removeCacheIfNeeded()
            
            let node = CacheNode(key,value)
            nodeMap[key] = node
            updateFreqListMap(add: node)
            
            size += 1
            leastFrequency = 1
        }
    }
    
    private func updateExists(node:CacheNode) {
        guard let list = freqListMap[node.count]  else {
            return
        }
        
        list.remove(node)
        
        if list.isEmpty {
            freqListMap[node.count] = nil
            if leastFrequency == node.count {
                leastFrequency += 1
            }
        }
        
        node.count += 1
        updateFreqListMap(add: node)
    }
    
    
    private func removeCacheIfNeeded(){
        guard size >= capacity, let list = freqListMap[leastFrequency] ,
            let key = list.removeLast()?.key else { return }
        
        size -= 1
        nodeMap[key] = nil
        if list.isEmpty { freqListMap[leastFrequency] = nil }
    }
    
    private func updateFreqListMap(add node:CacheNode) {
        let list = freqListMap[node.count,default:CacheList()]
        list.add(node)
        freqListMap[node.count] = list
    }
}

/**
 * Your LFUCache object will be instantiated and called as such:
 * let obj = LFUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
