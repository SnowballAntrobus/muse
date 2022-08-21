//
//  MainView.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/20/22.
//

import SwiftUI

struct MainView: View {
  @Binding var museEvents: [MuseEvent]
  @Binding var museTodos: [MuseTodo]
  @Binding var museHabits: [MuseHabit]
  @Environment(\.scenePhase) private var scenePhase
  let saveAction: () -> Void
    var body: some View {
      TabView {
        MuseEventsView(museEvents: $museEvents)
          .tabItem { Label("Events", systemImage: "calendar") }
        MuseTodosView(museTodos: $museTodos)
          .tabItem { Label("Todos", systemImage: "checkmark") }
        MuseHabitsView(museHabits: $museHabits)
          .tabItem { Label("Habits", systemImage: "clock.arrow.circlepath") }
      }
      .onChange(of: scenePhase) { phase in if phase == .inactive { saveAction() } }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
      MainView(museEvents: .constant(MuseEvent.data), museTodos: .constant(MuseTodo.data), museHabits: .constant(MuseHabit.data), saveAction: {})
    }
}
