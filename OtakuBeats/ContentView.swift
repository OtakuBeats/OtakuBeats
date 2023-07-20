//
//  ContentView.swift
//  OtakuBeats
//
//  Created by TaeVon Lewis on 5/10/23.
//

import SwiftUI



struct ContentView: View {
    @State private var searchText = ""
    @State var selectedGenres = Set<Genres>()
    @State private var selectedFilter = " "
    @State var toggleOn = false
    @State var sheetShowing = false
    @State var selectedAnime: Anime? // new state variable
    
    let anime: [Anime] = Anime.mockAnime
    let songs: [Song] = Song.mockSong
    
    var filteredAnime: [Anime] {
        anime.filter { $0.title.localizedCaseInsensitiveContains(searchText) && $0.title.lowercased().hasPrefix(searchText.lowercased()) }
    }
    
    var filteredSongs: [Song] {
        songs.filter { song in
            var shouldIncludeSong = true
            
            switch (selectedAnime, searchText.isEmpty) {
            case (let anime?, _):
                shouldIncludeSong = song.animeTitle == anime.title
            case (nil, false):
                shouldIncludeSong = song.title.localizedCaseInsensitiveContains(searchText)
            default:
                break
            }
            
            return shouldIncludeSong && (selectedGenres.isEmpty || selectedGenres.contains(song.genre))
        }
    }

    
    enum Genres: String, CaseIterable {
        case Rock
        case Jazz
        case Pop
    }
    

    var body: some View {
        NavigationView {
            VStack {
                if let selectedAnime = selectedAnime {
                    List {
                        ForEach(filteredAnime, id: \.id) { anime in
                            NavigationLink(destination: songListView(anime:anime, songs: filteredSongs)) {
                                Text(anime.title)
                            }
                        }
                    }
                    .searchable(text: $searchText)
                    .listStyle(.plain)
                } else {
                    List {
                        ForEach(filteredAnime, id: \.id) { anime in
                            Button(action: {
                                self.selectedAnime = anime
                            }) {
                                Text(anime.title)
                            }
                        }
                    }
                    .searchable(text: $searchText)
                    .listStyle(.plain)
                }
            }
            .onAppear {
                selectedAnime = nil
            }
            .navigationTitle("Otaku Beats")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        sheetShowing.toggle()
                    }, label: {
                        Text("Filter")
                    })
                }
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
        .onChange(of: searchText) { newSearchText in
            if newSearchText.isEmpty {
                selectedAnime = nil
            }
            
        }
        .padding()
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    var defaultSearch: some View {
//        if searchText.isEmpty {
//            return AnyView(
//            List(songs) { song in
//                Text(song.title)
//            }.scrollContentBackground(.hidden))
//        } else {
//            return AnyView (
//            List {
//                ForEach(filteredAnime) { anime in
//                    Text(anime.title)
//                }
//
//                ForEach(filteredSongs) { song in
//                    Text(song.title)
//                }
//            })
//        }
//    }




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}

