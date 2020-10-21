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
					destination: PersonDetailView(person: person),
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
	
	var body: some View {
		VStack {
			Image(systemName: person.iconName)
				.font(Font.system(size: 100))
				
			Text(person.job)
				.font(.callout)
				.navigationBarTitle(person.name)
				.padding(.top)
		}
		.padding()
		Spacer()
	}
}

struct PeopleViews_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView()
    }
}
