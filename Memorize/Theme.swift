//
//  Theme.swift
//  Memorize
//
//  Created by George Solorio on 7/28/20.
//  Copyright © 2020 George Solorio. All rights reserved.
//

import SwiftUI

struct Theme {
    
    fileprivate enum Set: Int, CaseIterable {
        case halloween, christmas, valentine, summer
    }
    
    fileprivate static var set: Set = .halloween
    
    static var color: Color {
        switch set {
        case .halloween:
            return Color.orange
        case .christmas:
            return Color.blue
        case .valentine:
            return Color.pink
        case .summer:
            return Color.yellow
        }
    }
    
    static var emojis: [String] {
        randomize()
        switch set {
        case .halloween:
            return ["👻", "💀", "🕷", "🧙‍♀️", "🧙‍♂️"]
        case .christmas:
            return ["❄️", "⛄️", "🤶", "🎅", "🎄"]
        case .valentine:
            return ["💌", "💘", "💝", "😍", "🧸"]
        case .summer:
            return ["🏖", "🥵", "☀️", "🍉", "🏝"]
        }
    }
    
    private static func randomize() {
        let randomTheme = Int.random(in: 0...Set.allCases.count - 1)
        set = Set.init(rawValue: randomTheme)!
    }
}
