//
//  SleepPlayerViewModel.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 29/11/24.
//

import Foundation
import Combine

final class SleepPlayerViewModel: ObservableObject {
    @Published var progressValue: Float = 0

    var musicMediaPlayer: MusicMediaPlayer
    var acceptProgressUpdates = true
    var subscriptions: Set<AnyCancellable> = .init()

    init(musicMediaPlayer: MusicMediaPlayer) {
        self.musicMediaPlayer = musicMediaPlayer
        listenToProgress()
    }

    private func listenToProgress() {
        musicMediaPlayer.currentProgressPublisher.sink { [weak self] progress in
            guard let self = self, self.acceptProgressUpdates else { return }
            self.progressValue = progress
        }.store(in: &subscriptions)
    }

    func didSliderChanged(_ didChange: Bool) {
        acceptProgressUpdates = !didChange
        if didChange {
            musicMediaPlayer.pause()
        } else {
            musicMediaPlayer.seek(to: progressValue)
            musicMediaPlayer.play()
        }
    }
}
