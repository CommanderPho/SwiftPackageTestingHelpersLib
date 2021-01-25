//
//  XCTestCase+CurrentTestInfo.swift
//  
//
//  Created by Pho Hale on 1/25/21.
//

import Foundation
import XCTest


public extension XCTestCase {

	// The name of the currently running test
	var currentTestName: String? {
		//"-[AppDatabaseTests testCreateNewConnection]"

		// get the name and remove the class name and what comes before the class name
//		var currentTestName = self.name.replacingOccurrences(of: "-[", with: "")
		// And then you'll need to remove the closing square bracket at the end of the test name
		let currentInnerString = self.name.replacingOccurrences(of: "-[", with: "").replacingOccurrences(of: "]", with: "")
		let splitString = currentInnerString.split(separator: " ")

		if (splitString.count < 2) {
			return nil
		}
		guard let validTestName = splitString.last else {
			return nil
		}
		return String(validTestName)
	}

	// The class of the currently running test
	var currentTestClass: String {
		let base = self.className  // "DoseDatastoreLibTests.AppDatabaseTests"
		let splitString = base.split(separator: ".")
		if (splitString.count < 2) {
			fatalError()
		}
		guard let validClassName = splitString.last else {
			fatalError()
		}
		return String(validClassName)
	}

}

