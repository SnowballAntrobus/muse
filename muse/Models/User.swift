//
//  User.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/16/22.
//

import Foundation
import SwiftUI

class User: ObservableObject {
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    private static var museEventsURL: URL { return documentsFolder.appendingPathComponent("museEvents.data") }
    private static var museTodosURL: URL { return documentsFolder.appendingPathComponent("museTodos.data") }
    
    @Published var museEvents: [MuseEvent] = []
    @Published var museTodos: [MuseTodo] = []
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.museEventsURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.museEvents = MuseEvent.data
                }
                #endif
                return
            }
            guard let museEvents = try? JSONDecoder().decode([MuseEvent].self, from: data) else {
                fatalError("Can't decode saved muse event data.")
            }
            DispatchQueue.main.async {
                self?.museEvents = museEvents
            }
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.museTodosURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.museTodos = MuseTodo.data
                }
                #endif
                return
            }
            guard let museTodos = try? JSONDecoder().decode([MuseTodo].self, from: data) else {
                fatalError("Can't decode saved muse todo data.")
            }
            DispatchQueue.main.async {
                self?.museTodos = museTodos
            }
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let museEvents = self?.museEvents else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(museEvents) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.museEventsURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let museTodos = self?.museTodos else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(museTodos) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.museTodosURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
}
