import UIKit

var str = "Hello, playground"


/*Given two words (beginWord and endWord), and a dictionary's word list, find all shortest transformation sequence(s) from beginWord to endWord, such that:

Only one letter can be changed at a time
Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
Note:

Return an empty list if there is no such transformation sequence.
All words have the same length.
All words contain only lowercase alphabetic characters.
You may assume no duplicates in the word list.
You may assume beginWord and endWord are non-empty and are not the same.
Example 1:

Input:
beginWord = "hit",
endWord = "cog",
wordList = ["hot","dot","dog","lot","log","cog"]

Output:
[
  ["hit","hot","dot","dog","cog"],
  ["hit","hot","lot","log","cog"]
]
Example 2:

Input:
beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log"]

Output: []

Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.*/


class Solution {
func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
      // generate graph
      let words = [beginWord] + Array(wordList)
      var keyWordGraph = [String: Set<String>]()
      var wordKeyGraph = [String: Set<String>]()
      for word in words {
          for idx in word.indices {
              let key = word.replacingCharacters(in: idx...idx, with: "?")
              keyWordGraph[key, default: []].insert(word)
              wordKeyGraph[word, default: []].insert(key)
          }
      }
    
    print(keyWordGraph)
    print(" ")
    print(wordKeyGraph)
      
      var graph = [String: Set<String>]()
      for word1 in words {
          for key in wordKeyGraph[word1] ?? [] {
              for word2 in keyWordGraph[key] ?? [] where word1 != word2 {
                  graph[word1, default: []].insert(word2)
                  graph[word2, default: []].insert(word1)
              }
          }
      }
    
    print(" ")
    print(graph)

      
      // mark distances using BFS
      var visited = Set<String>()
      var distanceMap = [Int: Set<String>]()
      var queue = [(beginWord, 0)]
      while queue.count > 0 {
          let (curr, distance) = queue.removeFirst()
          if !visited.contains(curr) {
              distanceMap[distance, default: []].insert(curr)
              visited.insert(curr)
              for next in graph[curr] ?? [] {
                  queue.append((next, distance + 1))
              }
          }
      }
    
    print(" ")
    print(distanceMap)

      // find result using BFS
      var result = [[String]]()
      find(beginWord, endWord, graph, distanceMap, 0, [], &result)
      return result
  }
  
  func find(_ word: String, _ endWord: String, _ graph: [String: Set<String>], _ distanceMap: [Int: Set<String>], _ distance: Int, _ visited: [String], _ result: inout [[String]]) {
      guard let words = distanceMap[distance], words.contains(word) else { return }
      
      let visited = visited + [word]
      if word == endWord {
          result.append(visited)
          return
      }

      for next in graph[word] ?? [] {
          find(next, endWord, graph, distanceMap, distance + 1, visited, &result)
      }
  }
}

var sol = Solution()
sol.findLadders("hit", "cog", ["hot","dot","dog","lot","log","cog"])
