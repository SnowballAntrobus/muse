//
//  MuseEventEditView.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/25/22.
//

import SwiftUI

struct MuseEventEditView: View {
  @Binding var museEventData: MuseEvent.Datas
    var body: some View {
      List {
        HStack {
          Text("Summary:")
          TextField("Summary", text: $museEventData.summary)
        }
        HStack {
          Text("Start:")
          TextField("Start", text: $museEventData.startDateTime)
        }
        HStack {
          Text("End:")
          TextField("End", text: $museEventData.endDateTime)
        }
      }
    }
}

struct MuseEventEditView_Previews: PreviewProvider {
    static var previews: some View {
      MuseEventEditView(museEventData: .constant(MuseEvent.data[0].data))
    }
}
