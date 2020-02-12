import UIKit

var str = "Hello, playground"

/*
 You have a String[] composed of words {bigsmallhuge, big, small, huge, smallhuge, other}.
 Output in a List<List<String>> the possible formations that can be made from each other.

 {{bigsmallhuge, big, small, huge},
 {bigsmallhuge, big, smallhuge },
 {smallhuge, small, huge}}
 */

func wordBreakMain(_ list:[String]) -> [[String]] {
    
    
    var list = list
    
    var result:[[String]] = []
    
    
    list.sort { (a,b) in
        return a.count < b.count
    }
    
    for word in list {
        var temp:[String] = []
        var tempword = list.removeLast()
//        print(tempword)
//        print(list)
        
        var output = wordBreak(tempword,list)
        
        if temp.count < 2 && temp.count > 0{
            temp.removeLast()
        } else {
            result.append(temp)
            result.append(output)
        }
    }
    
    
    return result
}


func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
    var cache :[String:[String]] = [:]
    
    return dfs(s, wordDict,&cache)
}

func dfs(_ s:String,_ wordDict: [String],_ cache: inout [String:[String]]) -> [String] {
    
    if s.count == 0 {
        return [""]
    }
    
    if let value = cache[s] {
        return value
    }
    
    var result:[String] = []
    let charArray = (s)
    
    for word in wordDict {
        if s.hasPrefix(word) {
            let subWordBreaks = dfs(String(charArray[word.endIndex...]), wordDict, &cache)
            for subWordBreak in subWordBreaks{
                if subWordBreak.isEmpty {
                    result.append(word)
                } else {
                    result.append(word + " " + subWordBreak)
                }
                
            }
        }
    }
    
    return result
}


var input = ["bigsmallhuge", "big", "small", "huge", "smallhuge", "other"]

print(wordBreakMain(input))

