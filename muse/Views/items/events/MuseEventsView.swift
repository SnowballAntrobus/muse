//
//  MuseEventsView.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/20/22.
//

import SwiftUI

struct MuseEventsView: View {
  @Binding var museEvents: [MuseEvent]
    var body: some View {
      NavigationView {
        VStack {
          HStack {
            Text("Events")
            Spacer()
            Button(action: {}, label: { Text("Add") })
          }
          .padding()
          List(museEvents) { museEvent in
            MuseEventCardView(museEvent: museEvent)
              .background(NavigationLink("", destination: {}).opacity(0))
          }
        }
        .navigationBarHidden(true)
      }
    }
}

struct MuseEventsView_Previews: PreviewProvider {
    static var previews: some View {
      MuseEventsView(museEvents: .constant(MuseEvent.data))
    }
}
