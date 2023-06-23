//
//  SongModel.swift
//  OtakuBeats
//
//  Created by Derrick on 5/10/23.
//

import SwiftUI

struct Anime: Identifiable {
    let id = UUID()
    
    // Kitsu API info
    let title: String
    let titleJap: String
    let posterImgUrl: String
}

struct Song: Identifiable {
    let id = UUID()
    
    let animeId: Int
    let genre: ContentView.Genres
    let length: Int
    let title: String
    let type: String
    let youtubeUrl: String
    let animeTitle: String
    //let uploadDate:
    //let uploaderId:
    
}

extension Anime {
    static var mockAnime: [Anime] = [
        Anime(title: "Cowboy Bebop", titleJap: "Cowbop Bebop", posterImgUrl: " "),
        Anime(title: "Naruto", titleJap: "Naruto", posterImgUrl: " "),
        Anime(title: "Bleach", titleJap: "Bleach", posterImgUrl: " ")
    ]
}

extension Song {
    static var mockSong: [Song] = [
        Song(animeId: 1, genre: ContentView.Genres.Jazz, length: Int(3.31), title: "Tank!", type: " ", youtubeUrl: "https://www.youtube.com/watch?v=UFFa0QoHWvE", animeTitle: "Cowboy Bebop"),
        Song(animeId: 2, genre: ContentView.Genres.Rock, length: Int(2.25), title: "Blue Bird", type: " ", youtubeUrl: " ", animeTitle: "Naruto"),
        Song(animeId: 3, genre: ContentView.Genres.Pop, length: Int(1.30), title: "Asterisk", type: " ", youtubeUrl: " ", animeTitle: "Bleach")
    ]
}
 

//user struct to be implemented later into the project




