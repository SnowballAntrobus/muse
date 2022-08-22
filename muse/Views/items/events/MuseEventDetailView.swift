//
//  MuseEventDetailView.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/22/22.
//

import SwiftUI

struct MuseEventDetailView: View {
  @Binding var museEvent: MuseEvent
    var body: some View {
      List {
        Text(museEvent.summary)
          .font(.headline)
        HStack {
          Text("Created:")
          Spacer()
          Text(museEvent.dtStamp.formatted())
        }
        HStack {
          Text("Start:")
          Spacer()
          Text(museEvent.startDateTime.formatted())
        }
        HStack {
          Text("End:")
          Spacer()
          Text(museEvent.endDateTime.formatted())
        }
      }
    }
}

struct MuseEventDetailView_Previews: PreviewProvider {
    static var previews: some View {
      MuseEventDetailView(museEvent: .constant(MuseEvent.data[0]))
    }
}
