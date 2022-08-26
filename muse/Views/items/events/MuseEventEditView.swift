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
          DatePicker("Start", selection: $museEventData.startDateTime)
        }
        HStack {
          DatePicker("End", selection: $museEventData.endDateTime)
        }
        if museEventData.startDateTime < museEventData.endDateTime {
          HStack {
            Spacer()
            Text("Error: start time < end time")
              .foregroundColor(.red)
            Spacer()
          }
        }
      }
    }
}

struct MuseEventEditView_Previews: PreviewProvider {
    static var previews: some View {
      MuseEventEditView(museEventData: .constant(MuseEvent.data[0].data))
    }
}
