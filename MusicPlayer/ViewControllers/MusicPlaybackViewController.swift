//
//  MusicPlaybackViewController.swift
//  MusicPlayer
//
//  Created by Sree Sai Raghava Dandu on 26/10/23.
//

import UIKit
import AVFoundation

class MusicPlaybackViewController: UIViewController {
    
    var selectedTrack: MusicTrack?
    var audioPlayer: AVAudioPlayer?
    var timer: Timer?
    
    let playPauseButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Play", for: .normal)
        button.addTarget(MusicPlaybackViewController.self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(MusicPlaybackViewController.self, action: #selector(volumeSliderChanged), for: .valueChanged)
        return slider
    }()
    
    let seekBar: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0.5
        slider.addTarget(MusicPlaybackViewController.self, action: #selector(seekBarSliderChanged), for: .valueChanged)
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let track = selectedTrack {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(string: track.url)!)
                audioPlayer?.prepareToPlay()
                audioPlayer?.delegate = self
            } catch {
                print("Error Init AudioPlayer")
            }
        }
        // SetupUI
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(playPauseButton)
        view.addSubview(volumeSlider)
        view.addSubview(seekBar)
        
        // Add constraints
        NSLayoutConstraint.activate([
            playPauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playPauseButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 50),
            
            volumeSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            volumeSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            volumeSlider.topAnchor.constraint(equalTo: playPauseButton.bottomAnchor, constant: 20),
            
            seekBar.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            seekBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            seekBar.topAnchor.constraint(equalTo: volumeSlider.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func playPauseButtonTapped() {
        
    }
    
    @objc func volumeSliderChanged() {
        
    }
    
    @objc func seekBarSliderChanged() {
        
    }
}

extension MusicPlaybackViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        // Update the UI
    }
}
