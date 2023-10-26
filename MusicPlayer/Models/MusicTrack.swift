//
//  MusicTrack.swift
//  MusicPlayer
//
//  Created by Sree Sai Raghava Dandu on 26/10/23.
//

import Foundation

/**
 [{"title":"title1","artist":"artist1","album":"album1","url":" https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"},{"title":"title2","artist":"artist2","album":"album2","url":" https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"}]
 */

struct MusicTrack: Decodable {
    var title: String
    var artist: String
    var album: String
    var url: String
}
