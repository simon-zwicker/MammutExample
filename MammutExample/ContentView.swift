//
//  ContentView.swift
//  MammutExample
//
//  Created by Simon Zwicker on 05.01.25.
//

import SwiftUI

struct ContentView: View {

	@State var fact: Fact?

    var body: some View {
        VStack {
			if let fact {
				Text(fact.text)
			} else {
				ContentUnavailableView("No Fact", systemImage: "xmark")
			}

			Spacer()

			Button("Get Random Fact") {
				getRandomFact()
			}

			Button("Get Today Fact") {
				getTodayFact()
			}

			Button("Login Test") {
				login()
			}
        }
        .padding()
    }

	private func getRandomFact() {
		Task {
			do {
				self.fact = try await Network.request(Fact.self, endpoint: ExampleAPI.randomFact(language: "de"))
			} catch let error as LocalizedError {
				print(error.complete)
			}
		}
	}

	private func getTodayFact() {
		Task {
			do {
				self.fact = try await Network.request(Fact.self, endpoint: ExampleAPI.todayFact(language: "de"))
			} catch let error as LocalizedError {
				print(error.complete)
			}
		}
	}

	private func login() {
		let loginData = Login(email: "Test@test.de", password: "1231231")
		Task {
			do {
				_ = try await Network.request(ErrorObj.self, endpoint: ExampleAPI.login(loginData))
			} catch let error as LocalizedError {
				print(error.complete)
			}
		}
	}
}

#Preview {
    ContentView()
}
