import UIKit

var str = "Hello, playground"


/*
 Jack plays a game of battleships with his friend Stacy. The game is played on a square map of N
 rows, numbered from 1 to N. Each row contains N cells, labeled with consecutive English upper-case
 letters (A, B, C, etc.). Each cell is identified by a string composed of its row number followed by its
 column number: for example, "9C" denotes the third cell in the 9th row, and "15D" denotes the
 fourth cell in the 15th row.
 Jack marks the positions of all his ships on the map (which is not shown to Stacy). Ships are defined
 by rectangles with a maximum area of 4 cells. Stacy picks map cells to hit some ships. A ship is
 considered to be hit if at least one of its constituent cells is hit. If all of a ship's cells are hit, the ship is
 sunk.
 The goal is to count the number of sunk ships and the number of ships that have been hit but not
 sunk.
 For example, the picture below shows a map of size N = 4 with two blue ships and five hits marked
 with the letter 'X':

 image

 In this example, one ship has been sunk and the other has been hit but not sunk. In the next picture,
 the sunken ship is shown in grey and the ship that has been hit but not yet sunk appears in red:

 image

 The positions of ships are given as a string S, containing pairs of positions describing respectively the
 top-left and bottom-right corner cells of each ship. Ships' descriptions are separated with commas.
 The positions of hits are given as a string T, containing positions describing the map cells that were
 hit: for the map in the example shown above, S = "1B 2C,2D 4D" and T = "2B 2D 3D 4D 4A". Ships in
 S and hits in T may appear in any order.
 Write a function:
 class Solution { public String solution(int N, String S, String T); }
 that, given the size of the map N and two strings S, T that describe the positions of ships and hits
 respectively, returns a string with two numbers: the count of sunken ships and the count of ships that
 have been hit but not sunk, separated with a comma.
 For instance, given N = 4, S = "1B 2C,2D 4D" and T = "2B 2D 3D 4D 4A", your function should return
 "1,1", as explained above.
 Given N = 3, S = "1A 1B,2C 2C" and T = "1B", your function should return "0,1", because one ship
 was hit but not sunk.
 The positions of ships are given as a string S, containing pairs of positions describing respectively the
 top-left and bottom-right corner cells of each ship. Ships' descriptions are separated with commas.
 The positions of hits are given as a string T, containing positions describing the map cells that were
 hit: for the map in the example shown above, S = "1B 2C,2D 4D" and T = "2B 2D 3D 4D 4A". Ships in
 S and hits in T may appear in any order.
 Write a function:

 class Solution { public String solution(int N, String S, String T); }
 that, given the size of the map N and two strings S, T that describe the positions of ships and hits
 respectively, returns a string with two numbers: the count of sunken ships and the count of ships that
 have been hit but not sunk, separated with a comma.

 For instance, given N = 4, S = "1B 2C,2D 4D" and T = "2B 2D 3D 4D 4A", your function should return
 "1,1", as explained above.

 Given N = 3, S = "1A 1B,2C 2C" and T = "1B", your function should return "0,1", because one ship
 was hit but not sunk.

 image

 Given N = 12, S = "1A 2A,12A 12A" and T = "12A", your function should return "1,0", because one
 ship was hit and sunk.
 Assume that:

 N is an integer within the range [1..26];
 string S contains the descriptions of rectangular ships of area not greater than 4 cells;
 there can be at most one ship located on any map cell (ships do not overlap);
 each map cell can appear in string T at most once;
 string S and string T contains only valid positions given in specified format.
 In your solution, focus on correctness. The performance of your solution will not be the focus of the
 assessment.
 */


func getSinkMissCounts(_ s:String, _ t:String) -> [Int] {
    
    var ships = s.components(separatedBy: ",")
    var visited:Set<String> = []
    
    var sinkCounter:[Int] = [0,0]
    
    for ship in ships {
        print(ship)
        
        var position = ship.components(separatedBy: " ")
        
        let top = position[0]
        let bottom = position[1]
        
        let charRowTop = Array(top)
        
        let topRow = String(Array(charRowTop[0..<top.count-1]))
        let topCol = charRowTop.last!
        
        print("topRow \(topRow)")
        print("topCol \(topCol)")
        
        let charRowBottom = Array(bottom)
        
        let bottomRow = String(Array(charRowBottom[0..<bottom.count-1]))
        let bottomCol = charRowBottom.last!
        
        print("bottomRow \(bottomRow)")
        print("bottomCol \(bottomCol)")
        
        let hits = t.components(separatedBy: " ")
        
        var count = 0
        
        for hit in hits {
            if visited.contains(hit)  {
                continue;
            }
            
            let hitArray = Array(hit)
            
            let row = String(Array(hitArray[0..<hit.count-1]))
            let col = hitArray.last!
            
            print("row \(row) and topRow \(topRow) and bottomRow \(bottomRow)")
            print("col \(col) and topCol \(topCol) and bottomCol\(bottomCol)")

            
            if (row >= topRow && col >= topCol && row <= bottomRow && col <= bottomCol) {
                count += 1
                visited.insert(hit)
            }
            
        }
        
        let columnHit = Int(bottomCol.unicodeScalars.first!.value - 65) - Int(topCol.unicodeScalars.first!.value - 65) + 1
        
        let rowHit = Int(bottomRow)! - Int(topRow)! + 1
        print("count is \(count)")
        print("columnHit is \(columnHit) and rowHit is \(rowHit)")
        
        if (count == columnHit * rowHit) {
            sinkCounter[0] += 1 // sink counter
        } else if count > 0 {
            sinkCounter[1] += 1 // hit counter
        }
    }
        
    return sinkCounter;
}

func getSinkMissCounts1(_ s:String, _ t:String) -> [Int] {
    
     var ships = s.components(separatedBy: ",")
      var visited:Set<String> = []
      
      var sinkCounter:[Int] = [0,0]
      
      for ship in ships {
          var coordinates = ship.components(separatedBy: " ")
          
          let top = coordinates[0]
          let bottom = coordinates[1]
          
          let charRowTop = Array(top)
          
          let topRow = Int(String(Array(charRowTop[0..<top.count-1])))!
          let topCol = charRowTop.last!
    
          
          let charRowBottom = Array(bottom)
          
          let bottomRow = Int(String(Array(charRowBottom[0..<bottom.count-1])))!
          let bottomCol = charRowBottom.last!
          
          let hits = t.components(separatedBy: " ")
          
          var count = 0
          
          for hit in hits {
              if visited.contains(hit)  {
                  continue;
              }
              
              let hitArray = Array(hit)
              let row = Int(String(Array(hitArray[0..<hit.count-1])))!
              let col = hitArray.last!
                        
              if (row >= topRow && col >= topCol && row <= bottomRow && col <= bottomCol) {
                  count += 1
                  visited.insert(hit)
              }
              
          }
          
          let columnHit = Int(bottomCol.unicodeScalars.first!.value - 65) - Int(topCol.unicodeScalars.first!.value - 65) + 1
          
        let rowHit = Int(bottomRow) - Int(topRow) + 1
          
          if (count == columnHit * rowHit) {
              sinkCounter[0] += 1 // sink counter
          } else if count > 0 {
              sinkCounter[1] += 1 // hit counter
          }
      }
          
      return sinkCounter;
}

var S2 = "1B 2C,2D 4D"
var T2 = "2B 2D 3D 4D 4A"

var S1 = "1A 1B,2C 2C"
var T1 = "1B"

var S = "1A 2A,12A 12A"
var T = "12A"

getSinkMissCounts1(S2, T2) //1,1
getSinkMissCounts1(S1, T1) //0,1
getSinkMissCounts1(S, T) //1,0




//var test = "Hello, playground"
//
//var test1 = test[test.startIndex..<test.endIndex]
//
//print(test1)


var s1 = "12"
var s2 = "2"

print(s1 <= s2)
