//
//  DataManager.swift
//  MusicPlayer
//
//  Created by Sree Sai Raghava Dandu on 26/10/23.
//

import Foundation

class DataManager {
    let musicService = MusicService()
    var musicCatalog: [MusicTrack] = []
    
    func fetchMusicCatalog(completion: @escaping (Error?)-> Void) {
        musicService.fetchMusicCatalog { [weak self] (musicTracks, error) in
            guard let self = self else { return }
            if let error = error {
                completion(error)
            } else if let musicTracks = musicTracks {
                self.musicCatalog = musicTracks
                completion(nil)
            }
        }
    }
}
