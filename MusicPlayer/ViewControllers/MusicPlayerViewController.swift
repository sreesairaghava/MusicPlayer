//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Sree Sai Raghava Dandu on 26/10/23.
//

import UIKit

class MusicPlayerViewController: UIViewController {
    
    // Create a tableView
    var tableView: UITableView!

    let dataManager = DataManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        setupUI()
        // Fetch music catalog from the server
        dataManager.fetchMusicCatalog { [weak self] error in
            if let error = error {
                //TODO: show an alert here
                print("Error: \(error)")
            } else {
                // Reload the tableview
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    // Setup UI
    private func setupUI() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.register(MusicTrackTableViewCell.self, forCellReuseIdentifier: "MusicTrackCell")
        // Add Constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MusicPlayerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.musicCatalog.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTrackCell", for: indexPath) as! MusicTrackTableViewCell
        let track = dataManager.musicCatalog[indexPath.row]
        cell.titleLabel.text = track.title
        cell.albumLabel.text = track.album
        cell.artistLabel.text = track.artist
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTrack = dataManager.musicCatalog[indexPath.row]
        
        let playbackVC = MusicPlaybackViewController()
        navigationController?.pushViewController(playbackVC, animated: true)
    }
}

