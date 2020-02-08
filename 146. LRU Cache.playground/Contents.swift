import UIKit

var str = "Hello, playground"


/*
 Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

 The cache is initialized with a positive capacity.

 Follow up:
 Could you do both operations in O(1) time complexity?

 Example:

 LRUCache cache = new LRUCache( 2 /* capacity */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.put(4, 4);    // evicts key 1
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4
 
 */

class Node{
    var prev:Node?
    var next:Node?
    var value:Int = -1
    var key:Int = -1
}


class LRUCache {
    
    let head = Node()
    let tail = Node()
    
    var count = 0
    var capacity = 0
    var map:[Int:Node] = [:]

    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
      
        if let node = map[key]{
            visit(node)
            return node.value
        }
        
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        
        var node:Node! = map[key]
        
        if node == nil {
            if count == capacity {
                node = dequeue()
            } else {
                node = Node()
                count += 1
            }
        }
        
        map[key] = node
        node.key = key
        node.value = value
        
      visit(node)
    }
    
    private func visit(_ node:Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        
        head.next!.prev = node
        node.next = head.next
        node.prev = head
        head.next = node
    }
    
    private func dequeue() -> Node {
        
        let result:Node! = tail.prev
        
        map.removeValue(forKey: result.key)
        
        result.prev!.next = tail
        tail.prev = result.prev
        
        result.prev = nil
        result.next = nil
        
        return result
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
 
