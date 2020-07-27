//
//  Array+Only.swift
//  Memorize
//
//  Created by George Solorio on 7/26/20.
//  Copyright © 2020 George Solorio. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
