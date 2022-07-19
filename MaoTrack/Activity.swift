//
//  Activity.swift
//  MaoTrack
//
//  Created by Arkadiusz Świętnicki on 18/07/2022.
//

import Foundation

struct Activity: Codable, Identifiable {
	var id = UUID()
	let name: String
	let description: String
	var noCompleted = 0
}
