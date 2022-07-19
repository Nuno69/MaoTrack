//
//  ActivityList.swift
//  MaoTrack
//
//  Created by Arkadiusz Świętnicki on 18/07/2022.
//

import Foundation
final class ActivityList: ObservableObject {
	@Published var activities = [Activity]() {
		didSet {
			if let encoded = try? JSONEncoder().encode(activities) {
				UserDefaults.standard.set(encoded, forKey: "activities")
			}
		}
	}
	init() {
		if let loaded = UserDefaults.standard.data(forKey: "activities") {
			if let decoded = try? JSONDecoder().decode([Activity].self, from: loaded) {
				activities = decoded
				activities.sort {
					$0.name < $1.name
				}
				return
			}
		}
activities = []
	}
}
