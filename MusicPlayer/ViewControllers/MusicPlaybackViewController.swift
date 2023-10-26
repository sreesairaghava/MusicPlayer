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
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
    
    @objc func playPauseButtonTapped() {
        
    }
    
    @objc func volumeSliderChanged() {
        
    }
}
