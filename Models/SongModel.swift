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
    let genre: String
    let length: Int
    let title: String
    let type: String
    let youtubeUrl: String
    //let uploadDate:
    //let uploaderId:
    
}


