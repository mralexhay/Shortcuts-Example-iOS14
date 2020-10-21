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
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate //
	
    var body: some Scene {
        WindowGroup {
            PeopleListView()
        }
    }
	
	// This class lets us respond to intents in an iOS14 SwiftUI app
	class AppDelegate: UIResponder, UIApplicationDelegate {
		func application(_ application: UIApplication, handlerFor intent: INIntent) -> Any? {
			
			switch intent {
				// If the intent being responded to is GetPeople, call the GetPeople intent handler
				case is GetPeopleIntent:
					return GetPeopleIntentHandler()
				default:
					return nil
			}
		}
	}
	
}
