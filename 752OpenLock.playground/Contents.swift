import UIKit

var str = "Hello, playground"

func openLock(_ deadends: [String], _ target: String) -> Int {
    
    var start:[String] = []
    var deadend = Set(deadends)
    var end:[String] = []
    
    var level = 0
    
    start.append("0000")
    end.append(target)
    
    while(!start.isEmpty && !end.isEmpty){
        
        if start.count > end.count {
            var temp1 = start
            start = end
            end = temp1
        }
        
        var temp = Set<String>()
        for str in start {
            if end.contains(str) {
                return level
            }
            if deadend.contains(str) {
                continue
            }
            
            deadend.insert(str)
            
            for i in 0..<4{
                let charArray:[Character] = Array(str);
                
                let c = charArray[i]
                
                let s1 = String(charArray[..<i]) + nextLetter(String(c))! + charArray.suffix(from: i+1)
                let s2 = String(charArray[..<i]) + previousLetter(String(c))! + charArray.suffix(from: i+1)
                
                if (!deadends.contains(s1)){
                    temp.insert(s1)
                }
                
                if (!deadends.contains(s2)){
                    temp.insert(s2)
                }
            }
        }
        
        level += 1
        start = end
        end = Array(temp)
    }
    return -1
}


func openLock1(_ deadends: [String], _ target: String) -> Int {
    
    var queue:[String] = []
    var deadend = Set(arrayLiteral: deadends)
    var visited = Set<String>();
    
    var level = 0
    
    queue.append("0000")
    visited.insert("0000")
    
    while(!queue.isEmpty){
        var size = queue.count
        while (size > 0){
            let s = queue.removeFirst()
            if (deadends.contains(s)){
                size -= 1
                continue
            }
            
            if (s == target){
                return level
            }
            
            for i in 0..<4{
                let charArray:[Character] = Array(s);
                
                let c = charArray[i]
                
                let s1 = String(charArray[..<i]) + nextLetter(String(c))! + charArray.suffix(from: i+1)
                let s2 = String(charArray[..<i]) + previousLetter(String(c))! + charArray.suffix(from: i+1)
                
                if (!visited.contains(s1) && (!deadends.contains(s1))){
                    queue.append(s1)
                    visited.insert(s1)
                }
                
                if (!visited.contains(s2) && (!deadends.contains(s2))){
                    queue.append(s2)
                    visited.insert(s2)
                }
            }
            size -= 1
        }
        level += 1
    }
    return -1
}


func nextLetter(_ letter: String) -> String? {
    guard let uniCode = UnicodeScalar(letter) else {
        return nil
    }
    switch uniCode {
    case "0" ..< "9":
        return String(UnicodeScalar(uniCode.value + 1)!)
    case "9":
        return "0"
    default:
        return nil
    }
}

func previousLetter(_ letter: String) -> String? {
    
    guard let uniCode = UnicodeScalar(letter) else {
        return nil
    }
    switch uniCode {
    case "0":
        return "9"
    case "1" ... "9":
        return String(UnicodeScalar(uniCode.value - 1)!)
    default:
        return nil
    }
}


var deadends = ["0201","0101","0102","1212","2002"]
var target = "0202"

openLock(deadends,target)

//let c = "c"
//type(of: c)
//
//print(c)
//print(UnicodeScalar(c)?.value)
//
//print(UnicodeScalar("c").value - UnicodeScalar("0").value)
//
//var x = UnicodeScalar("c").value - UnicodeScalar("0").value
//type(of: x)
//
//var y = Character(UnicodeScalar(x) ?? UnicodeScalar("0"))
//
//
//var
