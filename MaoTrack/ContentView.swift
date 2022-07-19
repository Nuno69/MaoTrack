//
//  ContentView.swift
//  MaoTrack
//
//  Created by Arkadiusz Świętnicki on 18/07/2022.
//

import SwiftUI

struct ContentView: View {
	@StateObject var activities = ActivityList()
	@State private var isAddingActivity = false
	func deleteItems(at offset: IndexSet) {
		activities.activities.remove(atOffsets: offset)
	}

    var body: some View {
		NavigationView {
			List {
				ForEach(activities.activities) {activity in
					ActivityIntroView(activity: activity, activities: activities)
				}.onDelete(perform: deleteItems)
			}.navigationTitle("Mao Track").toolbar {
				Button("Add a new activity") {
					isAddingActivity = true
				}
			}.sheet(isPresented: $isAddingActivity) {
				AddActivityView(activities: activities)
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
