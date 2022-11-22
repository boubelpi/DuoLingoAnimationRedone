//
//  struct_of_text_under_animation.swift
//  DuoLingoAnimationRedone
//
//  Created by Pavel on 22/11/22.
//

import Foundation
import SwiftUI

struct text_under_animation {
    var a : [String]
    init(a: [String]) {
        self.a = a
    }
    mutating func rerandom() {
        self.a.shuffle()
    }
    mutating func find_text_under_animation() -> String {
        var i = 0
        while (i < 10) {
            i += 1
            self.rerandom()
        }
        return self.a[0]
    }
}
