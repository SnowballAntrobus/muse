//
//  museApp.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/16/22.
//

import SwiftUI

@main
struct museApp: App {
  @ObservedObject private var user = User()
    var body: some Scene {
        WindowGroup {
          MainView(museEvents: $user.museEvents, museTodos: $user.museTodos, museHabits: $user.museHabits) { user.save() }
            .onAppear { user.load() }
        }
    }
}
