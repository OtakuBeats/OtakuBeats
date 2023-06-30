//
//  songListView.swift
//  OtakuBeats
//
//  Created by Derrick on 6/28/23.
//

import SwiftUI

struct songListView: View {
    @State var sheetShowing = false
    @State var selectedGenres = Set<Genres>()
    let anime: Anime
    let songs: [Song]
    enum Genres: String, CaseIterable {
        case Rock
        case Jazz
        case Pop
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(songs, id: \.id) { song in
                    NavigationLink(destination: songView(song: song)) {
                        Text(song.title)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    sheetShowing.toggle()
                }, label: {
                    Text("Filter")
                })
            }
        }
        .sheet(isPresented: $sheetShowing) {
            VStack {
                ForEach(Genres.allCases, id: \.self) {genre in
                    Toggle (isOn: Binding(
                        get: {self.selectedGenres.contains(genre)},
                        set: { newToggleState in
                            if newToggleState {
                                selectedGenres.insert(genre)
                            } else {
                                selectedGenres.remove(genre)
                            }}
                    )) {Text(genre.rawValue)}
                }
                .padding(.horizontal)
                
                Button("Apply") {
                    sheetShowing.toggle()
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
