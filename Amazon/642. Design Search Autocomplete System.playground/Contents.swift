import UIKit

var str = "Hello, playground"

/*
 
 Design a search autocomplete system for a search engine. Users may input a sentence (at least one word and end with a special character '#'). For each character they type except '#', you need to return the top 3 historical hot sentences that have prefix the same as the part of sentence already typed. Here are the specific rules:

 The hot degree for a sentence is defined as the number of times a user typed the exactly same sentence before.
 The returned top 3 hot sentences should be sorted by hot degree (The first is the hottest one). If several sentences have the same degree of hot, you need to use ASCII-code order (smaller one appears first).
 If less than 3 hot sentences exist, then just return as many as you can.
 When the input is a special character, it means the sentence ends, and in this case, you need to return an empty list.
 Your job is to implement the following functions:

 The constructor function:

 AutocompleteSystem(String[] sentences, int[] times): This is the constructor. The input is historical data. Sentences is a string array consists of previously typed sentences. Times is the corresponding times a sentence has been typed. Your system should record these historical data.

 Now, the user wants to input a new sentence. The following function will provide the next character the user types:

 List<String> input(char c): The input c is the next character typed by the user. The character will only be lower-case letters ('a' to 'z'), blank space (' ') or a special character ('#'). Also, the previously typed sentence should be recorded in your system. The output will be the top 3 historical hot sentences that have prefix the same as the part of sentence already typed.

  
 Example:
 Operation: AutocompleteSystem(["i love you", "island","ironman", "i love leetcode"], [5,3,2,2])
 The system have already tracked down the following sentences and their corresponding times:
 "i love you" : 5 times
 "island" : 3 times
 "ironman" : 2 times
 "i love leetcode" : 2 times
 Now, the user begins another search:

 Operation: input('i')
 Output: ["i love you", "island","i love leetcode"]
 Explanation:
 There are four sentences that have prefix "i". Among them, "ironman" and "i love leetcode" have same hot degree. Since ' ' has ASCII code 32 and 'r' has ASCII code 114, "i love leetcode" should be in front of "ironman". Also we only need to output top 3 hot sentences, so "ironman" will be ignored.

 Operation: input(' ')
 Output: ["i love you","i love leetcode"]
 Explanation:
 There are only two sentences that have prefix "i ".

 Operation: input('a')
 Output: []
 Explanation:
 There are no sentences that have prefix "i a".

 Operation: input('#')
 Output: []
 Explanation:
 The user finished the input, the sentence "i a" should be saved as a historical sentence in system. And the following input will be counted as a new search.

  
 Note:

 The input sentence will always start with a letter and end with '#', and only one blank space will exist between two words.
 The number of complete sentences that to be searched won't exceed 100. The length of each sentence including those in the historical data won't exceed 100.
 Please use double-quote instead of single-quote when you write test cases even for a character input.
 Please remember to RESET your class variables declared in class AutocompleteSystem, as static/class variables are persisted across multiple test cases. Please see here for more details.
 */


class TrieNode {
    // the dictionary of TrieNodes
    var next:[Character:TrieNode]
    // The dictionary that contains all strings that pass through this TrieNode and their counts.
    var list:[String:Int]
    
    init() {
        self.next = [Character:TrieNode]()
        self.list = [String:Int]()
    }
    
}


class AutocompleteSystem {
    
    let numberOfResults = 3
    
    var root:TrieNode
    var searchNode:TrieNode?
    var lastInput:String
    
    //build the trie
    init(_ sentences: [String], _ times: [Int]) {
        self.root = TrieNode()
        self.searchNode = root
        self.lastInput = ""
        for i in 0..<sentences.count{
            addSentence(sentences[i],times[i])
        }
        
    }
    
    func input(_ c: Character) -> [String] {
        var result:[String] = []
        if c == "#" {
            // If the input stream has finished, add the sentence and reset search state.
            addSentence(lastInput, 1)
            searchNode = root
            lastInput = ""
        } else {
            // If the input stream starts/continues, save the character.
            lastInput += String(c)
            guard searchNode != nil else {
                return result
            }
            
            if let next = searchNode!.next[c] {
                // Get and sort the `countList`.
                let countList = next.list.sorted { (entry0, entry1) -> Bool in
                                   let (string0, value0) = entry0
                                   let (string1, value1) = entry1
                                   return value0 > value1 || (value0 == value1 && string0 < string1)
                }
                
                // Return at most `numberOfResults` results.
                var i = 0
                for (string, _) in countList {
                    i += 1
                    result.append(string)
                    if i == numberOfResults {
                        break
                    }
                }
                searchNode = next
                return result
            } else {
                // Set `searchNode` to `nil` to finish searcing for this round.
                searchNode = nil
            }
        }
        return result
    }
    
    private func addSentence(_ sentence: String, _ timeToAdd: Int) {
        var node = root
        let chars = Array(sentence)
        for char in chars {
            // If the `TrieNode` for the character doesn't exist, create it.
            if node.next[char] == nil {
               node.next[char] = TrieNode()
            }
            // If previous count exists, add the count; otherwise set the count.
            node.next[char]!.list[sentence] = node.next[char]!.list[sentence]! + timeToAdd
            node = node.next[char]!
        }
    }
}

/**
 * Your AutocompleteSystem object will be instantiated and called as such:
 * let obj = AutocompleteSystem(sentences, times)
 * let ret_1: [String] = obj.input(c)
 */
