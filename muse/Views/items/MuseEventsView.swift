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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MuseEventsView_Previews: PreviewProvider {
    static var previews: some View {
      MuseEventsView(museEvents: .constant(MuseEvent.data))
    }
}
