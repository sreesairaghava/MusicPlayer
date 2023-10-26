//
//  MusicService.swift
//  MusicPlayer
//
//  Created by Sree Sai Raghava Dandu on 26/10/23.
//

import Foundation

class MusicService {
    func fetchMusicCatalog(completion: @escaping([MusicTrack]?,Error?) -> Void) {
        guard let url = URL(string: "https://www.jsonkeeper.com/b/C47J") else {
            completion(nil,NSError(domain: "InvalidURL", code: -1))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(nil, error)
            }
            if let data = data {
                do{
                    let musicTracks = try JSONDecoder().decode([MusicTrack].self, from: data)
                    completion(musicTracks,nil)
                }
                catch {
                    completion(nil,error)
                }
            }
        }.resume()
    }
}
