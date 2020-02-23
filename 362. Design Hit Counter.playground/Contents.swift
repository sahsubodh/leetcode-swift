import UIKit

var str = "Hello, playground"

/*
 Design a hit counter which counts the number of hits received in the past 5 minutes.
 
 Each function accepts a timestamp parameter (in seconds granularity) and you may assume that calls are being made to the system in chronological order (ie, the timestamp is monotonically increasing). You may assume that the earliest timestamp starts at 1.
 
 It is possible that several hits arrive roughly at the same time.
 
 Example:
 
 HitCounter counter = new HitCounter();
 
 // hit at timestamp 1.
 counter.hit(1);
 
 // hit at timestamp 2.
 counter.hit(2);
 
 // hit at timestamp 3.
 counter.hit(3);
 
 // get hits at timestamp 4, should return 3.
 counter.getHits(4);
 
 // hit at timestamp 300.
 counter.hit(300);
 
 // get hits at timestamp 300, should return 4.
 counter.getHits(300);
 
 // get hits at timestamp 301, should return 3.
 counter.getHits(301);
 Follow up:
 What if the number of hits per second could be very large? Does your design scale?
 */



class HitCounter {
    
    class HitCounter {
        
        class Node {
            var t: Int // timestamp
            var n: Int // number of hits received at that timestamp
            var next: Node?
            
            init(t: Int, n: Int, next: Node? = nil) {
                self.t = t
                self.n = n
                self.next = next
            }
        }
        
        private var listHead: Node?
        private var listTail: Node?
        
        /** Initialize your data structure here. */
        init() {
            
        }
        
        /** Record a hit.
         @param timestamp - The current timestamp (in seconds granularity). */
        func hit(_ timestamp: Int) {
            if let tail = listTail, tail.t == timestamp { // hits that happen in the same second
                tail.n += 1
            } else { // hits with a new timestamp
                let tail = Node(t: timestamp, n: 1)
                
                if listTail == nil {
                    listTail = tail
                    listHead = tail
                } else {
                    listTail!.next = tail
                    listTail = tail
                    
                    let threshold = timestamp - 300
                    while listHead != nil, listHead!.t <= threshold { // remove outdated nodes
                        listHead = listHead!.next
                    }
                    
                    // `tail` won't change here because its timestamp will always be in range
                }
            }
        }
        
        /** Return the number of hits in the past 5 minutes.
         @param timestamp - The current timestamp (in seconds granularity). */
        func getHits(_ timestamp: Int) -> Int {
            var res = 0
            let threshold = timestamp - 300
            while listHead != nil, listHead!.t <= threshold { // remove outdated nodes
                listHead = listHead!.next
            }
            
            if listHead == nil {
                listTail = nil
                return res
            }
            
            // get count
            var p = listHead
            while p != nil {
                res += p!.n
                p = p!.next
            }
            
            return res
        }
    }
}

/**
 * Your HitCounter object will be instantiated and called as such:
 * let obj = HitCounter()
 * obj.hit(timestamp)
 * let ret_2: Int = obj.getHits(timestamp)
 */
