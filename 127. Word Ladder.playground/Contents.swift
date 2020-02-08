import UIKit

var str = "Hello, playground"

/*Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:

Only one letter can be changed at a time.
Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
Note:

Return 0 if there is no such transformation sequence.
All words have the same length.
All words contain only lowercase alphabetic characters.
You may assume no duplicates in the word list.
You may assume beginWord and endWord are non-empty and are not the same.
Example 1:

Input:
beginWord = "hit",
endWord = "cog",
wordList = ["hot","dot","dog","lot","log","cog"]

Output: 5

Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
return its length 5.
Example 2:

Input:
beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log"]

Output: 0

Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.
 */


class Solution {
    
   func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
       if !wordList.contains(endWord) {
           return 0
       }
       
       let dict = Set(wordList)
       var beginSet = Set<String>()
       var endSet = Set<String>()
       var visitedSet = Set<String>()
       var length = 1
       var found = false
       
       beginSet.insert(beginWord)
       endSet.insert(endWord)
       
       while !found && !beginSet.isEmpty && !endSet.isEmpty {
           var nextSet = Set<String>()
           //accelerating search speed by swap begin and end
           if beginSet.count > endSet.count {
               swap(&beginSet, &endSet)
           }
           found = helper(beginSet, endSet, dict, &visitedSet, &nextSet)
           beginSet = nextSet
           length += 1
       }
       return found ? length : 0
   }
   
   private func helper(_ beginSet: Set<String>, _ endSet: Set<String>, _ dict: Set<String>,
                       _ visitedSet: inout Set<String>, _ nextSet: inout Set<String>) -> Bool {
       
       let alphaArray = Array("abcdefghijklmnopqrstuvwxyz")
       
       for word in beginSet {
           for i in 0 ..< word.count {
               var chars = Array(word)
               for j in 0 ..< alphaArray.count{
                   chars[i] = alphaArray[j]
                   let str = String(chars)
                   if dict.contains(str) {
                       if endSet.contains(str) {
                           return true
                       }
                       if !visitedSet.contains(str) {
                           nextSet.insert(str)
                           visitedSet.insert(str)
                       }
                   }
               }
           }
       }
       return false
   }
    
    
    func ladderLength1(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        
        if !wordList.contains(endWord){
            return 0
        }
        
        let aToz = "abcdefghijklmnopqrstuvwxyz"
        var beginSet:Set<String> = []
        var endSet:Set<String> = []
        var level = 1
        var visited:Set<String> = []
        
        beginSet.insert(beginWord)
        endSet.insert(endWord)
        
        while (!beginSet.isEmpty && !endSet.isEmpty) {
            if beginSet.count > endSet.count {
                swap(&beginSet,&endSet)
            }
            
            var temp:Set<String> = []
            for word in beginSet {
                var charArray = Array(word)
                for i in 0..<charArray.count{
                    for char in aToz {
                        let old = charArray[i]
                        charArray[i] = char
                        let target = String(charArray)
                        if endSet.contains(target) {
                            return level + 1
                        }
                        
                        if !visited.contains(target) && wordList.contains(target){
                            visited.insert(target)
                            temp.insert(target)
                        }
                        
                        charArray[i] = old
                    }
                    
                }
                
            }
            
            level += 1
            beginSet = temp
             
        }
        
        return 0
    }
}
