//
//  PeopleViews.swift
//  ShortcutsExampleiOS14
//
//  Created by Alex Hay on 21/10/2020.
//

import SwiftUI

struct PeopleListView: View {
	
	var people = peopleArray
	
	var body: some View {
		NavigationView {
			List(people, id: \.id) { person in
				NavigationLink(
					destination: PersonDetailView(person: person, note: .constant("")), // Adding in a constant empty string here
					label: {
						Label(title: {
							VStack(alignment: .leading) {
								Text(person.name)
								Text(person.job)
									.foregroundColor(.secondary)
									.font(.caption)
							}
						}, icon: {
							Image(systemName: person.iconName)
						})
					})
			}
			.navigationBarTitle("People")
		}
		
	}
}

struct PersonDetailView: View {
	
	var person: Person
	@Binding var note: String
	
	var body: some View {
		List {
			HStack {
				Text("Job")
					.foregroundColor(.secondary)
				Spacer()
				Text(person.job)
			}
			HStack {
				Text("Icon")
					.foregroundColor(.secondary)
				Spacer()
				Image(systemName: person.iconName)
			}
			if note != "" {
				HStack {
					Text("Note")
						.foregroundColor(.secondary)
					Spacer()
					Text(note)
				}
			}
		}
		.navigationBarTitle(person.name)
	}
}

struct PeopleViews_Previews: PreviewProvider {
	static var previews: some View {
		PeopleListView()
	}
}
