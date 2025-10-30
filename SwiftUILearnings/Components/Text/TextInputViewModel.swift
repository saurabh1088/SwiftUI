//
//  TextInputViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 29/10/25.
//

import Foundation
import Combine

enum TextInputViewState: Equatable {
    case idle
    case loading
    case loaded
}

final class TextInputViewModel: ObservableObject {
    @Published var name = String()
    @Published var text = String()
    @Published var track = String()
    @Published var debounceText = String()
    @Published var debounceResult = String()
    @Published var state: TextInputViewState = .idle
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpDebounce()
    }
    
    func setUpDebounce() {
        $debounceText
            .dropFirst()
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                self?.debounceResultingOperation()
                self?.debounceResult = "Hello, \(value)!"
            })
            .store(in: &cancellables)
    }
    
    func debounceResultingOperation() {
        state = .loading
        // MainActor here is added to guarantee the code is on main thread
        // async mockAsyncOperation can however execute on background thread as per it's implementation
        Task { @MainActor in
            do {
                try await self.mockAsyncOperation()
            } catch {
                print("Error during API call: \(error)")
            }
            self.state = .loaded
        }
    }
    
    func mockAsyncOperation() async throws {
        let delay: TimeInterval = 5.0
        try await Task.sleep(for: .seconds(delay))
    }
}
