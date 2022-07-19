//
//  AddActivityView.swift
//  MaoTrack
//
//  Created by Arkadiusz Świętnicki on 19/07/2022.
//

import Foundation
import SwiftUI
struct AddActivityView: View {
	@State private var activityName = ""
	@State private var activityDescription = ""
	@ObservedObject var activities: ActivityList
	@Environment(\.dismiss)
 var dismiss
	var body: some View {
		NavigationView {
			Form {
TextField("Activity name", text: $activityName)
TextField("Activity description", text: $activityDescription)
			}.navigationTitle("Add an activity").toolbar {
				Button("OK") {
					activities.activities.append(Activity(name: activityName, description: activityDescription))
					dismiss()
				}
			}
		}
	}
}
