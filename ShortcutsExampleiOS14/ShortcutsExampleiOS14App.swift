//
//  ShortcutsExampleiOS14App.swift
//  ShortcutsExampleiOS14
//
//  Created by Alex Hay on 21/10/2020.
//

import SwiftUI
import Intents

@main
struct ShortcutsExampleiOS14App: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	@State var personToShow: Person? = nil // The person we'll pass in to our detail view
	@State var note: String = "" // The note we'll pass into our detail view
	
	var body: some Scene {
		WindowGroup {
			PeopleListView()
				.sheet(item: $personToShow) { person in
					NavigationView {
						PersonDetailView(person: person, note: $note)
					}
				}
				.onContinueUserActivity("com.alexhay.example.viewPerson") { userActivity in
					if let intent = userActivity.interaction?.intent as? ViewPersonIntent,
					   let person = peopleArray.filter({ $0.name == intent.person?.displayString ?? "" }).first {
						note = intent.note ?? ""
						personToShow = person
					}
				}
		}
	}
	
	// This class lets us respond to intents in an iOS14 SwiftUI app
	class AppDelegate: UIResponder, UIApplicationDelegate {
		func application(_ application: UIApplication, handlerFor intent: INIntent) -> Any? {
			
			switch intent {
				// Call the appropriate intent handler
				case is GetPeopleIntent:
					return GetPeopleIntentHandler()
				case is ViewPersonIntent:
					return ViewPersonIntentHandler()

				default:
					return nil
			}
		}
	}
	
}





