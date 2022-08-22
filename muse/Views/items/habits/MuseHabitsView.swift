//
//  MuseHabitsView.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/20/22.
//

import SwiftUI

struct MuseHabitsView: View {
  @Binding var museHabits: [MuseHabit]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MuseHabitsView_Previews: PreviewProvider {
    static var previews: some View {
      MuseHabitsView(museHabits: .constant(MuseHabit.data))
    }
}
