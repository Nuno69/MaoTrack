//
//  ActivityIntroView.swift
//  MaoTrack
//
//  Created by Arkadiusz Świętnicki on 19/07/2022.
//

import Foundation
import SwiftUI
struct ActivityIntroView: View {
	let activity: Activity
	@ObservedObject var activities: ActivityList
	var body: some View {
		VStack(alignment: .leading) {
			NavigationLink {
				ActivityDetailView(activity: activity, activities: activities)
			} label: {
				Text(activity.name).foregroundColor(activity.noCompleted > 0 ? Color.blue : Color.red)
				Text(activity.noCompleted == 0 ? "Never completed" : "Completed \(activity.noCompleted) times")
			}
		}
	}
}
