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

@MainActor
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
                if !value.isEmpty {
                    self?.debounceResultingOperation()
                    self?.debounceResult = "Hello, \(value)!"
                }
            })
            .store(in: &cancellables)
    }
    
    func debounceResultingOperation() {
        Task {
            do {
                try await self.mockAsyncOperation()
            } catch {
                print("Error during API call: \(error)")
            }
            
        }
    }
    
    func mockAsyncOperation() async throws {
        state = .loading
        let delay: TimeInterval = 5.0
        try await Task.sleep(for: .seconds(delay))
        self.state = .loaded
    }
}
