//
//  Fact.swift
//  MammutExample
//
//  Created by Simon Zwicker on 05.01.25.
//

struct Fact: Codable {
	let id: String
	let text: String
	let source: String
	let sourceUrl: String
	let language: String
	let permalink: String

	enum CodingKeys: String, CodingKey {
		case id
		case text
		case source
		case sourceUrl = "source_url"
		case language
		case permalink
	}
}
