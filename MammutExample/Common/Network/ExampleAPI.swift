//
//  ExampleAPI.swift
//  MammutExample
//
//  Created by Simon Zwicker on 05.01.25.
//

import Foundation
import Mammut

enum ExampleAPI {
	case randomFact(language: String?)
	case todayFact(language: String?)
	case login(Login)
}

extension ExampleAPI: Endpoint {
	var path: String {
		switch self {
		case .randomFact: "/facts/random"
		case .todayFact: "/facts/today"
		case .login: "/login"
		}
	}

	var method: MammutMethod {
		switch self {
		case .login: .post
		default: .get
		}
	}

	var headers: [MammutHeader] {
		[.content(.type("application/json"))]
	}

	var parameters: [String : Any] {
		var parameters: [String: Any] = [:]

		switch self {
		case .randomFact(language: let lang), .todayFact(language: let lang):
			guard let lang else { return parameters }
			parameters["language"] = lang
		case .login(let login):
			parameters = login.dictionary
		}

		return parameters
	}

	/// This part is currently work in progress for an specific API which takes URL Encoded + Body Parameters
	var parametersUrl: [String : Any] { [:] }

	var encoding: Encoding {
		switch self {
		case .login: .json
		default: .url
		}
	}
}
