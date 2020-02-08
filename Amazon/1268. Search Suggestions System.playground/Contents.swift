import UIKit

var str = "Hello, playground"


/*
 Given an array of strings products and a string searchWord. We want to design a system that suggests at most three product names from products after each character of searchWord is typed. Suggested products should have common prefix with the searchWord. If there are more than three products with a common prefix return the three lexicographically minimums products.

 Return list of lists of the suggested products after each character of searchWord is typed.

  

 Example 1:

 Input: products = ["mobile","mouse","moneypot","monitor","mousepad"], searchWord = "mouse"
 Output: [
 ["mobile","moneypot","monitor"],
 ["mobile","moneypot","monitor"],
 ["mouse","mousepad"],
 ["mouse","mousepad"],
 ["mouse","mousepad"]
 ]
 Explanation: products sorted lexicographically = ["mobile","moneypot","monitor","mouse","mousepad"]
 After typing m and mo all products match and we show user ["mobile","moneypot","monitor"]
 After typing mou, mous and mouse the system suggests ["mouse","mousepad"]
 Example 2:

 Input: products = ["havana"], searchWord = "havana"
 Output: [["havana"],["havana"],["havana"],["havana"],["havana"],["havana"]]
 Example 3:

 Input: products = ["bags","baggage","banner","box","cloths"], searchWord = "bags"
 Output: [["baggage","bags","banner"],["baggage","bags","banner"],["baggage","bags"],["bags"]]
 Example 4:

 Input: products = ["havana"], searchWord = "tatiana"
 Output: [[],[],[],[],[],[],[]]
  

 Constraints:

 1 <= products.length <= 1000
 There are no repeated elements in products.
 1 <= Σ products[i].length <= 2 * 10^4
 All characters of products[i] are lower-case English letters.
 1 <= searchWord.length <= 1000
 All characters of searchWord are lower-case English letters.z
 */


class Solution {
  
    class Trie {
        var char: Character?
        var route: [Character:Trie]
        var suggestions:[String]
        
        init(_ char: Character?){
            self.char = char
            self.route = [Character:Trie]()
            suggestions = []
        }
    }
    
    
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        
        var root = Trie(nil)
        
        for p in products{ // build Trie.
            var t = root
            for char in p {  // insert current product into Trie.
                if t.route[char] == nil {
                    t.route[char] = Trie(char)
                }
                t = t.route[char]!
                t.suggestions.append(p) // put products with same prefix into suggestion list.
                t.suggestions.sort() // sort products.
                if t.suggestions.count > 3 {  // maintain 3 lexicographically minimum strings.
                    t.suggestions.removeLast()
                }
            }
        }
            
            var result:[[String]] = []
            for char in searchWord {
                if root.route[char] != nil {
                    root = root.route[char]!
            }
                result.append(root == nil ? [] : root.suggestions)
        }
        
        return result
    }
}


var products = ["mobile","mouse","moneypot","monitor","mousepad"], searchWord = "mouse"


var sol = Solution()
print(sol.suggestedProducts(products, searchWord))


var products1 = ["bags","baggage","banner","box","cloths"], searchWord1 = "bags"
print(sol.suggestedProducts(products1, searchWord1))


var products2 = ["havana"], searchWord2 = "tatiana"
print(sol.suggestedProducts(products2, searchWord1))

