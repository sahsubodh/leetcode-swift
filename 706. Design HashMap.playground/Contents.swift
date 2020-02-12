import UIKit

var str = "Hello, playground"

/*
 Design a HashMap without using any built-in hash table libraries.

 To be specific, your design should include these functions:

 put(key, value) : Insert a (key, value) pair into the HashMap. If the value already exists in the HashMap, update the value.
 get(key): Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
 remove(key) : Remove the mapping for the value key if this map contains the mapping for the key.

 Example:

 MyHashMap hashMap = new MyHashMap();
 hashMap.put(1, 1);
 hashMap.put(2, 2);
 hashMap.get(1);            // returns 1
 hashMap.get(3);            // returns -1 (not found)
 hashMap.put(2, 1);          // update the existing value
 hashMap.get(2);            // returns 1
 hashMap.remove(2);          // remove the mapping for 2
 hashMap.get(2);            // returns -1 (not found)

 Note:

 All keys and values will be in the range of [0, 1000000].
 The number of operations will be in the range of [1, 10000].
 Please do not use the built-in HashMap library.
 */

//https://medium.com/@stevenpcurtis.sc/implement-a-dictionary-in-swift-5e06052aa120


struct Element {
    var key:Int
    var value:Int
}

class MyHashMap {

    var buckets:[[Element]] = []
    
    /** Initialize your data structure here. */
    init() {
        buckets = [Array.init(repeating: Element(key: -1, value: -1), count: 2)]
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        remove(key)
        let position = abs(key.hashValue) % buckets.count
        buckets[position].append(Element(key: key, value: value))
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        let position = abs(key.hashValue) % buckets.count
        return buckets[position].first { $0.key == key }?.value ?? -1
        
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        let position = abs(key.hashValue) % buckets.count
        buckets[position].removeAll(where: { $0.key == key } )
        
    }

    var currentLoadFactor: Double {
        return Double ( buckets.flatMap{$0}.filter{$0.key != -1}.count ) / Double(buckets.count)
    }
    
    func resize() {
        if currentLoadFactor > 0.9 {
            // double the capacity
            let extraBuckets : [[Element]] = [Array(repeating: Element(key: -1, value: -1), count: buckets.count)]
            buckets += extraBuckets
        } else {
            if currentLoadFactor < 0.4 {
                // remove blank buckets
                buckets.removeAll(where: { $0.contains(where: { $0.key == -1 })})
                resize()
            }
        }
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
