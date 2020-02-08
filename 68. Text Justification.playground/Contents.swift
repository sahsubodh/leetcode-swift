import UIKit

var str = "Hello, playground"

/*
 Given an array of words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.

 You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly maxWidth characters.

 Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line do not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.

 For the last line of text, it should be left justified and no extra space is inserted between words.

 Note:

 A word is defined as a character sequence consisting of non-space characters only.
 Each word's length is guaranteed to be greater than 0 and not exceed maxWidth.
 The input array words contains at least one word.
 Example 1:

 Input:
 words = ["This", "is", "an", "example", "of", "text", "justification."]
 maxWidth = 16
 Output:
 [
    "This    is    an",
    "example  of text",
    "justification.  "
 ]
 Example 2:

 Input:
 words = ["What","must","be","acknowledgment","shall","be"]
 maxWidth = 16
 Output:
 [
   "What   must   be",
   "acknowledgment  ",
   "shall be        "
 ]
 Explanation: Note that the last line is "shall be    " instead of "shall     be",
              because the last line must be left-justified instead of fully-justified.
              Note that the second line is also left-justified becase it contains only one word.
 Example 3:

 Input:
 words = ["Science","is","what","we","understand","well","enough","to","explain",
          "to","a","computer.","Art","is","everything","else","we","do"]
 maxWidth = 20
 Output:
 [
   "Science  is  what we",
   "understand      well",
   "enough to explain to",
   "a  computer.  Art is",
   "everything  else  we",
   "do                  "
 ]
 */


//https://leetcode.com/problems/text-justification/discuss/181479/Very-easy-Java-Solution-with-explanation-beats-100

class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var lines:[String] = []
        var i = 0
        while  i < words.count {
            var j = i , line = [String](), letterCount = 0
            while (j < words.count && letterCount + (j-i) + words[j].count <= maxWidth){
                line.append(words[j])
                letterCount += words[j].count
                j += 1
            }
            lines.append(line.joined(separator: " "))
            i = j
        }
        
        for i in 0..<lines.count{
            lines[i] = justified(lines[i], maxWidth, i == lines.count - 1)
        }
        
        return lines
    }
    
    func justified(_ line: String, _ maxWidth: Int, _ isLastLine: Bool) -> String {
//        print(line)
        let words = line.split(separator: " ").map(String.init)
//        print(words)
//        print(type(of: words))
        if words.count == 1 || isLastLine {
            return line + Array(repeating: " ", count: maxWidth - line.count).joined()
        } else {
            let insertCount = words.count - 1
            let spaceCount = maxWidth - (words.map{ $0.count}.reduce(0,+))
            let space = Array(repeating: " ", count: spaceCount / insertCount).joined()
            let spaceWithExtra = Array(repeating: " ", count: spaceCount / insertCount + 1).joined()
            var extra = spaceCount % insertCount
            var line = ""
            for (idx,word) in words.enumerated(){
                if idx > 0 {
                    line += (extra > 0 ?  spaceWithExtra:space)
                    extra -= 1
                }
                line += word
            }
            
            
            return line
        }
    }
}

var sol = Solution()
print(sol.fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16))
