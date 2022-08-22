//
//  MuseEventCardView.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/22/22.
//

import SwiftUI

struct MuseEventCardView: View {
  var museEvent: MuseEvent
    var body: some View {
      VStack(alignment: .leading) {
        Text(museEvent.summary)
          .font(.headline)
        Spacer()
        HStack {
          Text(museEvent.startDateTime.formatted())
          Text("-")
          Text(museEvent.endDateTime.formatted())
        }
        .font(.caption)
      }
    }
}

struct MuseEventCardView_Previews: PreviewProvider {
    static var previews: some View {
      MuseEventCardView(museEvent: MuseEvent.data[0])
        .previewLayout(.fixed(width: 400, height: 60))
    }
}
