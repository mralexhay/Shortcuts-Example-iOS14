//
//  GetAllPeopleIntentHandler.swift
//  ShortcutsExampleiOS14
//
//  Created by Alex Hay on 21/10/2020.
//

import Intents
import UIKit

class GetPeopleIntentHandler: NSObject, GetPeopleIntentHandling {
	func handle(intent: GetPeopleIntent, completion: @escaping (GetPeopleIntentResponse) -> Void) {
		// Define an empty array of our custom ShortcutsPerson type
		var resultArray = [ShortcutsPerson]()
		// Loop through our people array and add create new ShortcutsPerson objects which are added to our result array
		for person in peopleArray {
			// The new 'Visual List' API accepts an optional INImage thumbnail to display next to the display name in Shortcuts lists. Here, we're creating one from the SFSymbol names stored in our people array
			let thumbnail = INImage.systemImageNamed(person.iconName)
			let resultPerson = ShortcutsPerson(identifier: nil, display: person.name, subtitle: person.job, image: thumbnail)
			// Populate our ShortcutsPerson's properties
			resultPerson.job = person.job
			if let imageData = UIImage(systemName: person.iconName)?.jpegData(compressionQuality: 1.0) {
				resultPerson.image = INFile(data: imageData, filename: "\(person.name).jpg", typeIdentifier: "public.jpeg")
			} else {
				// We'll display an error if we can't create a UIImage from the person's iconName
				let errorResponse = GetPeopleIntentResponse.failure(error: "Couldn't create the user image for \(person.name). \"\(person.iconName)\" may not be a valid SFSymbol Name")
				completion(errorResponse)
				return
			}
			resultArray.append(resultPerson)
		}
		// We define a response marked as successful with the success code and add our result array to it
		let response = GetPeopleIntentResponse.init(code: .success, userActivity: nil)
		response.result = resultArray
		completion(response)
	}
}
