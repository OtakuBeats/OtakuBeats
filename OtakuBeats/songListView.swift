//
//  songListView.swift
//  OtakuBeats
//
//  Created by Derrick on 6/28/23.
//

import SwiftUI

struct songListView: View {
    let anime: Anime
    let songs: [Song]
    var body: some View {
        NavigationView {
            List {
                ForEach(songs, id: \.id) { song in
                    NavigationLink(destination: songView(song: song)) {
                        Text(song.title)
                    }
                }
            }
        }
    }
    
    
    
    
    struct songListView_Previews: PreviewProvider {
        static var previews: some View {
            songListView(anime: Anime(title: "Cowboy Bebop", titleJap: "Cowbop Bebop", posterImgUrl: " "), songs: [Song(animeId: 1, genre: ContentView.Genres.Jazz, length: Int(3.31), title: "Tank!", type: " ", youtubeUrl: "https://www.youtube.com/watch?v=UFFa0QoHWvE", animeTitle: "Cowboy Bebop")])
        }
    }
}
