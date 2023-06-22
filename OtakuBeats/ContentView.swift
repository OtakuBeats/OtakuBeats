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
    
    let anime: [Anime] = Anime.mockAnime
    let songs: [Song] = Song.mockSong
    
    var filteredAnime: [Anime] {
        anime.filter { $0.title.localizedCaseInsensitiveContains(searchText) && $0.title.lowercased().hasPrefix(searchText.lowercased()) }
    }
    
    var filteredSongs: [Song] {
        if (selectedGenres.isEmpty) {
            return songs
        } else {
            return songs.filter{(selectedGenres.contains($0.genre))}
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
                SearchBar(searchText: $searchText)
                List {
                    ForEach(filteredSongs) { song in
                        /*@START_MENU_TOKEN@*/Text(song.title)/*@END_MENU_TOKEN@*/
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Otaku Beats")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        sheetShowing.toggle()
                    }, label: {
                        Text("Filter")
                    })
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
        }
    }
        .padding()
}
    
    
    var defaultSearch: some View {
        if searchText.isEmpty {
            return AnyView(
            List(songs) { song in
                Text(song.title)
            }.scrollContentBackground(.hidden))
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
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

