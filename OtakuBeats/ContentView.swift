//
//  ContentView.swift
//  OtakuBeats
//
//  Created by TaeVon Lewis on 5/10/23.
//

import SwiftUI



struct ContentView: View {
    @State private var searchText = ""
    @State var genres = ["Rock", "Jazz", "Pop"]
    @State var filterCategories = ["Length", "Type", "Date Uploaded", "Clear"]
    @State private var selectedFilter = " "
    
    let anime: [Anime] = Anime.mockAnime
    let songs: [Song] = Song.mockSong
    
    var filteredAnime: [Anime] {
        anime.filter { $0.title.localizedCaseInsensitiveContains(searchText) && $0.title.lowercased().hasPrefix(searchText.lowercased()) }
    }
    
    var filteredSongs: [Song] {
        songs.filter { $0.title.localizedCaseInsensitiveContains(searchText) && $0.title.lowercased().hasPrefix(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText)
                if selectedFilter == " " {
                    defaultSearch
                } else {
                    //filtered search
                    genreSearch }
            }
            .navigationTitle("Otaku Beats")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Menu {
                            Picker("Filter", selection: $selectedFilter)
                                {
                                    ForEach(genres, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.automatic)
                             } label: {
                                 Text("Genre")
                             }
                        
                        
                        
                    Picker("Filter", selection: $selectedFilter)
                        {
                            ForEach(filterCategories, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.automatic)
                        .onChange(of: selectedFilter) { value in
                            if value == "Clear" {
                                selectedFilter = " "
                            }
                            
                        }
                } label: {
                    Text("Filter")
                }
            }
        }
    }
        .padding()
    }
    
    
    var defaultSearch: some View {
        if searchText.isEmpty {
            return AnyView(
            List(songs) { song in
                Text(song.title)
            }
            )
        } else {
            return AnyView (
            List {
                ForEach(filteredAnime) { anime in
                    Text(anime.title)
                }
                
                ForEach(filteredSongs) { song in
                    Text(song.title)
                }
            })
        }
    }
    
    
    var genreSearch: some View {
        return AnyView (
            List {
                switch selectedFilter {
                case "Rock": ForEach(filteredSongs) { song in
                    if selectedFilter == "Rock" && song.genre == "Rock" {
                        Text(song.title)
                    }
                }
                    
                case "Jazz": ForEach(filteredSongs) { song in
                    if selectedFilter == "Jazz" && song.genre == "Jazz" {
                        Text(song.title)
                    }
                }
                
                case "Pop": ForEach(filteredSongs) { song in
                    if selectedFilter == "Pop" && song.genre == "Pop" {
                        Text(song.title)
                    }
                }
                    
                default: Text("error")
                    }
            })
    }
    
    
    
    
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

