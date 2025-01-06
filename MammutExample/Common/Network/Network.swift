//
//  Network.swift
//  MammutExample
//
//  Created by Simon Zwicker on 05.01.25.
//

import Foundation
import Mammut

struct Network {

	static var environment: NetworkEnvironment = .production

	static private var api: Mammut {
		Mammut(components: environment.components, loglevel: .debug)
	}

	static func request<T: Codable>(
		_ T: T.Type,
		environment: NetworkEnvironment = .production,
		endpoint: Endpoint
	) async throws(MammutError) -> T {
		self.environment = environment
		let result = await req(T.self, endpoint )
		switch result {
		case .success(let success): return success
		case .failure(let failure): throw failure.self
		}
	}

	static private func req<T: Codable>(
		_ T: T.Type,
		_ endpoint: Endpoint
	) async -> Result<T, MammutError> {
		await api.request(endpoint, error: ErrorObj.self)
	}
}
