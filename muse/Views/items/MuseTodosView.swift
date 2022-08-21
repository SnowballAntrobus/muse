//
//  MuseTodosView.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/20/22.
//

import SwiftUI

struct MuseTodosView: View {
  @Binding var museTodos: [MuseTodo]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MuseTodosView_Previews: PreviewProvider {
    static var previews: some View {
      MuseTodosView(museTodos: .constant(MuseTodo.data))
    }
}
