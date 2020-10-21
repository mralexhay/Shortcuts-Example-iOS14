//
//  People.swift
//  ShortcutsExampleiOS14
//
//  Created by Alex Hay on 21/10/2020.
//

import SwiftUI
import UIKit

struct Person {
	var id: Int
	var name: String
	var job: String
	var iconName: String
}

let peopleArray: [Person] = [
	Person(id: 1, name: "Joe Bloggs", job: "Artist", iconName: "paintpalette"),
	Person(id: 2, name: "Peter Roberts", job: "Taxi Driver", iconName: "car"),
	Person(id: 3, name: "Sarah Love", job: "Author", iconName: "text.book.closed")
]
