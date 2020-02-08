import UIKit

var str = "Hello, playground"


/*
 You work on a team whose job is to understand the most sought after toys for the holiday season. A teammate of yours has built a webcrawler that extracts a list of quotes about toys from different articles. You need to take these quotes and identify which toys are mentioned most frequently. Write an algorithm that identifies the top N toys out of a list of quotes and list of toys.

 Your algorithm should output the top N toys mentioned most frequently in the quotes.

 Input:
 The input to the function/method consists of five arguments:

 numToys, an integer representing the number of toys
 topToys, an integer representing the number of top toys your algorithm needs to return;
 toys, a list of strings representing the toys,
 numQuotes, an integer representing the number of quotes about toys;
 quotes, a list of strings that consists of space-sperated words representing articles about toys

 Output:
 Return a list of strings of the most popular N toys in order of most to least frequently mentioned

 Note:
 The comparison of strings is case-insensitive. If the value of topToys is more than the number of toys, return the names of only the toys mentioned in the quotes. If toys are mentioned an equal number of times in quotes, sort alphabetically.

 Example 1:

 Input:
 numToys = 6
 topToys = 2
 toys = ["elmo", "elsa", "legos", "drone", "tablet", "warcraft"]
 numQuotes = 6
 quotes = [
 "Elmo is the hottest of the season! Elmo will be on every kid's wishlist!",
 "The new Elmo dolls are super high quality",
 "Expect the Elsa dolls to be very popular this year, Elsa!",
 "Elsa and Elmo are the toys I'll be buying for my kids, Elsa is good",
 "For parents of older kids, look into buying them a drone",
 "Warcraft is slowly rising in popularity ahead of the holiday season"
 ];

 Output:
 ["elmo", "elsa"]

 Explanation:
 elmo - 4
 elsa - 4
 "elmo" should be placed before "elsa" in the result because "elmo" appears in 3 different quotes and "elsa" appears in 2 different quotes.
 */


struct Counter {
    var count = 0
    var indicies:Set<Int> = []
}


func nBuzzWords(_ numToys:Int, _ topToys:Int,_ toys:[String],_ numQuotes:Int, quotes:[String]) -> [String] {
    
    var dict:[String:Counter] = [:]
    
    //initialize dictionary
    for toy in toys{
        dict[toy.lowercased()] = Counter(count: 0, indicies: [])
    }
    
    
    // remove all characters other than alphanumerics
    var undesiredChars = CharacterSet.alphanumerics.inverted

    var index = 0
    
    for quote in quotes{
        //remove all characters other than alphanumerics and make lower case
        var inputArray:[String] = quote.lowercased().components(separatedBy: undesiredChars)
        
        for word in inputArray{
            if dict[word] != nil {
                dict[word]!.count += 1
                dict[word]!.indicies.insert(index)
            }
        }
     
        index += 1
    }
    
    let result = Array(dict.keys.sorted {
        let freq1 = dict[$0]?.count ?? 0
        let freq2 = dict[$1]?.count ?? 0
        if freq1 == freq2 {
            let indicies1 = dict[$0]?.indicies.count ?? 0
            let indicies2 = dict[$1]?.indicies.count ?? 0
            
            if (indicies1 ==  indicies2) {
                return $0 < $1
            } else {
                return indicies1 > indicies2
            }
            
        } else {
            return freq1 > freq2
        }}.prefix(topToys))
        
    return result
}

var numToys = 6
var topToys = 2
var toys = ["elmo", "elsa", "legos", "drone", "tablet", "warcraft"]
var numQuotes = 6
var quotes = [
"Elmo is the hottest of the season! Elmo will be on every kid's wishlist!",
"The new Elmo dolls are super high quality",
"Expect the Elsa dolls to be very popular this year, Elsa!",
"Elsa and Elmo are the toys I'll be buying for my kids, Elsa is good",
"For parents of older kids, look into buying them a drone",
"Warcraft is slowly rising in popularity ahead of the holiday season"
];


print(nBuzzWords(numToys, topToys, toys, numQuotes, quotes: quotes))



func nBuzzWords1(_ numToys:Int, _ topToys:Int,_ toys:[String],_ numQuotes:Int, quotes:[String]) -> [String] {
    
    var dict:[String:Int] = [:]
    
    //initialize dictionary
    for toy in toys{
        dict[toy.lowercased()] = 0
    }
    
    var undesiredChars = CharacterSet.alphanumerics.inverted
    
    
    for quote in quotes{
        
        var inputArray:[String] = quote.lowercased().components(separatedBy: undesiredChars)
        
        for word in inputArray{
            if dict[word] != nil {
                dict[word]! += 1
            }
        }
        
    }
    
    let result = Array(dict.keys.sorted {
        let freq1 = dict[$0] ?? 0
        let freq2 = dict[$1] ?? 0
        if freq1 == freq2 {
            return $0 < $1
        } else {
            return freq1 > freq2
        }
        
        }.prefix(topToys))
        
    return result
}
