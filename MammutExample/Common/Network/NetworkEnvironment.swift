//
//  NetworkEnvironment.swift
//  MammutExample
//
//  Created by Simon Zwicker on 05.01.25.
//

import Foundation

enum NetworkEnvironment {
	case production

	var schema: String { "https" }
	var host: String { "uselessfacts.jsph.pl" }
	var path: String { "/api/v2" }

	var components: URLComponents {
		var components = URLComponents()
		components.scheme = schema
		components.host = host
		components.path = path
		return components
	}
}
