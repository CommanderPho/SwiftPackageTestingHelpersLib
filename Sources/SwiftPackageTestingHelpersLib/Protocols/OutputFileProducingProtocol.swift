//
//  File.swift
//  
//
//  Created by Pho Hale on 1/25/21.
//

import Foundation
import XCTest

// Implementors produce a copy of some output files as a result of running in their private testing subdirectory.
public protocol OutputFileProducingProtocol {
	static var folderMode: TestFilesMode {get}

	// This is the folder that all test-specific subdirectories will be created in (depending on Self.folderMode)
	static var rootTestingParentFolder: URL {get}

	// Builds the URL from the Self.rootTestingParentFolder to the specified testSubdirectory
	static func getTestingSubdirectory(testSubdir: String?) -> URL

	// Gets the URL of the currently running test, dependent on Self.folderMode
	func getCurrentTestSubdirectory() -> URL?
	func getTestSubdirectorPathString() -> String?


}


public extension OutputFileProducingProtocol where Self: XCTestCase {

	// Gets the URL of the currently running test, dependent on Self.folderMode
	func getCurrentTestSubdirectory() -> URL? {
		return Self.getTestingSubdirectory(testSubdir: self.getTestSubdirectorPathString())
	}


	func getTestSubdirectorPathString() -> String? {
		switch Self.folderMode {
		case .SharedFolder:
			return nil
		case .UniqueFolderPerTestClass:
			return "\(self.currentTestClass)"
		case .UniqueFolderPerTest:
			guard let currTestName = self.currentTestName else {
				fatalError()
			}
			return "\(self.currentTestClass)_\(currTestName)"
		}
	}

	// Builds the URL from the Self.rootTestingParentFolder to the specified testSubdirectory
	static func getTestingSubdirectory(testSubdir: String?) -> URL {
		let activeParentFolder: URL
		if let validTestSubdir = testSubdir {
			activeParentFolder = Self.rootTestingParentFolder.appendingPathComponent(validTestSubdir)
		}
		else {
			activeParentFolder = Self.rootTestingParentFolder
		}
		return activeParentFolder
	}


}
