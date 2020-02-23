import UIKit

var str = "Hello, playground"

/*
 Given a data stream input of non-negative integers a1, a2, ..., an, ..., summarize the numbers seen so far as a list of disjoint intervals.

 For example, suppose the integers from the data stream are 1, 3, 7, 2, 6, ..., then the summary will be:

 [1, 1]
 [1, 1], [3, 3]
 [1, 1], [3, 3], [7, 7]
 [1, 3], [7, 7]
 [1, 3], [6, 7]
  

 Follow up:

 What if there are lots of merges and the number of disjoint intervals are small compared to the data stream's size?
 */



class SummaryRanges {

    var matrix = [[Int]]()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    func addNum(_ val: Int) {
        var pre = -2
        var preIdx = -1
        var copy = [[Int]]()
        
        for i in matrix.indices{
            let curL = matrix[i][0] , curU = matrix[i][1]
            if val >= curL && val <= curU { return }
            if val > curU {
                pre = curU
                preIdx = i
                copy.append(matrix[i])
            }
            else {
                if val + 1 == curL && val - 1 == pre {
                    copy.removeLast()
                    copy.append([matrix[preIdx][0], curU])
                    copy.append(contentsOf: matrix[i+1..<matrix.count])
                    matrix = copy
                    return
                } else if val - 1 == pre {
                    copy.removeLast()
                    copy.append([matrix[preIdx][0], val])
                    copy.append(contentsOf: matrix[i..<matrix.count])
                    matrix = copy
                    return
                } else if val + 1 == curL {
                    copy.append([val, curU])
                    copy.append(contentsOf: matrix[i+1..<matrix.count])
                    matrix = copy
                    return
                } else {
                    copy.append([val, val])
                    copy.append(contentsOf: matrix[i..<matrix.count])
                    matrix = copy
                    return
                }
            }
        }
        
        if let last = matrix.last{
            if last[1] + 1 == val {
                matrix.removeLast()
                matrix.append([last[0],val])
                return
            }
        }
        
        matrix.append([val,val])
    }
    
    func getIntervals() -> [[Int]] {
        return matrix
    }
}

/**
 * Your SummaryRanges object will be instantiated and called as such:
 * let obj = SummaryRanges()
 * obj.addNum(val)
 * let ret_2: [[Int]] = obj.getIntervals()
 */
