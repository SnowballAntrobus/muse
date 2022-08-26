//
//  MuseEventDetailView.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/22/22.
//

import SwiftUI

struct MuseEventDetailView: View {
  @Binding var museEvent: MuseEvent
  @State private var museEventData: MuseEvent.Datas = MuseEvent.Datas()
  @State private var isPresented = false
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
        HStack {
          Spacer()
          Button("Edit") {
            isPresented = true
            museEventData = museEvent.data
          }
          Spacer()
        }
      }
      .fullScreenCover(isPresented: $isPresented) {
        
      }
    }
}

struct MuseEventDetailView_Previews: PreviewProvider {
    static var previews: some View {
      MuseEventDetailView(museEvent: .constant(MuseEvent.data[0]))
    }
}
