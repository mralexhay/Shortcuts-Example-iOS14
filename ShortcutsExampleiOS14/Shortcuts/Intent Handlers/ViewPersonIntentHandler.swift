//
//  ViewPersonIntentHandler.swift
//  ShortcutsExampleiOS14
//
//  Created by Alex Hay on 21/10/2020.
//

import Intents
import UIKit

class ViewPersonIntentHandler: NSObject, ViewPersonIntentHandling {
	func resolvePerson(for intent: ViewPersonIntent, with completion: @escaping (ViewPersonPersonResolutionResult) -> Void) {
		// Show an error if the user hasn't selected a person
		guard let person = intent.person else {
			completion(ViewPersonPersonResolutionResult.unsupported(forReason: .noPerson))
			return
		}
		completion(ViewPersonPersonResolutionResult.success(with: person))
	}
	
	func handle(intent: ViewPersonIntent, completion: @escaping (ViewPersonIntentResponse) -> Void) {
		let userActivity = NSUserActivity(activityType: "com.alexhay.example.viewPerson")
		completion(ViewPersonIntentResponse.init(code: .continueInApp, userActivity: userActivity))
	}
	
	func resolveNote(for intent: ViewPersonIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
		let noteString = intent.note ?? ""
		completion(INStringResolutionResult.success(with: noteString))
	}
	
	func providePersonOptionsCollection(for intent: ViewPersonIntent, with completion: @escaping (INObjectCollection<ShortcutsPerson>?, Error?) -> Void) {
		
		// We'll convert our list of Person in the peopleArray to ShortcutsPeople along with subtitles and images which will be displayed in the shortcuts action's parameter list
		let shortcutsPeople: [ShortcutsPerson] = peopleArray.map { person in
			let shortcutsPerson = ShortcutsPerson(identifier: nil,
												  display: person.name,
												  pronunciationHint: nil,
												  subtitle: person.job,
												  image: INImage.systemImageNamed(person.iconName))
			return shortcutsPerson
		}

		 // Create a collection with the array of ShortcutsPeople.
		 let collection = INObjectCollection(items: shortcutsPeople)

		 // Call the completion handler, passing the collection.
		 completion(collection, nil)
	}
	

}
