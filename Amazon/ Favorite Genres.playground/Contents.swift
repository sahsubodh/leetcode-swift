import UIKit

var str = "Hello, playground"


/*
 Amazon | OA 2019 | Favorite Genres
 
 Given a map Map<String, List<String>> userSongs with user names as keys and a list of all the songs that the user has listened to as values.

 Also given a map Map<String, List<String>> songGenres, with song genre as keys and a list of all the songs within that genre as values. The song can only belong to only one genre.

 The task is to return a map Map<String, List<String>>, where the key is a user name and the value is a list of the user's favorite genre(s). Favorite genre is the most listened to genre. A user can have more than one favorite genre if he/she has listened to the same number of songs per each of the genres.

 Example 1:

 Input:
 userSongs = {
    "David": ["song1", "song2", "song3", "song4", "song8"],
    "Emma":  ["song5", "song6", "song7"]
 },
 songGenres = {
    "Rock":    ["song1", "song3"],
    "Dubstep": ["song7"],
    "Techno":  ["song2", "song4"],
    "Pop":     ["song5", "song6"],
    "Jazz":    ["song8", "song9"]
 }

 Output: {
    "David": ["Rock", "Techno"],
    "Emma":  ["Pop"]
 }

 Explanation:
 David has 2 Rock, 2 Techno and 1 Jazz song. So he has 2 favorite genres.
 Emma has 2 Pop and 1 Dubstep song. Pop is Emma's favorite genre.
 Example 2:

 Input:
 userSongs = {
    "David": ["song1", "song2"],
    "Emma":  ["song3", "song4"]
 },
 songGenres = {}

 Output: {
    "David": [],
    "Emma":  []
 }
 */

public class FavoriteGenres{
    
    public func getFavoriteGenres(_ userToSongs:[String:[String]],_ genreToSongs:[String:[String]]) ->
        [String:[String]]
    {
        var result:[String:[String]] = [:]
        
        guard userToSongs.count > 0 else {
            return result
        }
        
        let songToGenre = createSongToGenreMapping(genreToSongs)
        
        for (user,songs) in userToSongs {
            
            var genreToCount:[String:Int] = [:] // Count genres for each user
            
            for song in songs {
                var genre = songToGenre[song] ?? ""
                genreToCount[genre,default: 0] += 1
            }
            
            var favoriteGenres:[String] = []
            var maxValue = Int.min
            
            for (genre,count) in genreToCount{
                if genre == "" {
                    result[user,default: []] = []
                } else if count > maxValue{
                    maxValue = count
                    favoriteGenres.removeAll()
                    favoriteGenres.append(genre)
                    result[user,default: []] = favoriteGenres

                } else if count == maxValue {
                    favoriteGenres.append(genre)
                    result[user,default: []] = favoriteGenres

                }
            }
            

        }
        
        return result
    }
    
    private func createSongToGenreMapping(_ genreToSongs:[String:[String]]) -> [String:String]{
        var songToGenre:[String:String] = [:]

        for (genre,songs) in genreToSongs {
            for song in songs {
                songToGenre[song] = genre
            }
        }
        
        return songToGenre
    }
}


var userSongs = [
   "David": ["song1", "song2", "song3", "song4", "song8"],
   "Emma":  ["song5", "song6", "song7"]
]

var songGenres = [
   "Rock":    ["song1", "song3"],
   "Dubstep": ["song7"],
   "Techno":  ["song2", "song4"],
   "Pop":     ["song5", "song6"],
   "Jazz":    ["song8", "song9"]
]


var userSongs1 = [
   "David": ["song1", "song2"],
   "Emma":  ["song3", "song4"]
]

var songGenres1:[String:[String]] = [:]



var sol = FavoriteGenres()
//print(sol.getFavoriteGenres(userSongs, songGenres))

print(sol.getFavoriteGenres(userSongs1, songGenres1))
