import UIKit

var str = "Hello, playground"


/*
 A sentence S is given, composed of words separated by spaces. Each word consists of lowercase and uppercase letters only.

 We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)

 The rules of Goat Latin are as follows:

 If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
 For example, the word 'apple' becomes 'applema'.
  
 If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add "ma".
 For example, the word "goat" becomes "oatgma".
  
 Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
 For example, the first word gets "a" added to the end, the second word gets "aa" added to the end and so on.
 Return the final sentence representing the conversion from S to Goat Latin.

  

 Example 1:

 Input: "I speak Goat Latin"
 Output: "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
 Example 2:

 Input: "The quick brown fox jumped over the lazy dog"
 Output: "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
  

 Notes:

 S contains only uppercase, lowercase and spaces. Exactly one space between each word.
 1 <= S.length <= 150.
 */

class Solution {
    func toGoatLatin(_ S: String) -> String {
        
        var array = S.components(separatedBy: " ")
        
        for i in 0..<array.count{
            if !isVowel(c: array[i].first!) {
                array[i].append(array[i].first!)
                array[i].remove(at: array[i].startIndex)
            }
            array[i].append("ma")
            for n in 0..<i+1{
                array[i].append("a")
            }
        }
        
        return array.joined(separator: " ")
        
    }
    
    func isVowel(c:Character) -> Bool {
        let vowel:[Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        return vowel.contains(c)
    }
}
