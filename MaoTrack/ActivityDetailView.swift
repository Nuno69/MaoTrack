//
//  ActivityDetailView.swift
//  MaoTrack
//
//  Created by Arkadiusz Świętnicki on 19/07/2022.
//

import Foundation
import SwiftUI
struct ActivityDetailView: View {
	let activity: Activity
	@ObservedObject var activities: ActivityList
	var body: some View {
		List {
			Text("Activity details").font(.title)
			Text(activity.description)
			Text("This activity has been completed \(activity.noCompleted) times")
			Button {
var tempActivity = activity
				tempActivity.noCompleted += 1
				if let index = activities.activities.firstIndex(where: {$0.id == tempActivity.id}) {
					activities.activities.remove(at: index)
					activities.activities.append(tempActivity)
				}
			} label: {
				Image(systemName: "plus")
			}.accessibilityLabel("Mark completion")
		}.navigationTitle(activity.name).navigationBarTitleDisplayMode(.inline)
	}
}
