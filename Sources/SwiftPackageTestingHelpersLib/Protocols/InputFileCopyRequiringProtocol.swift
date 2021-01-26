//
//  File.swift
//  
//
//  Created by Pho Hale on 1/25/21.
//

import Foundation
import XCTest

// Implementors require a unique of some input files to function, likely because they modify them and thus will become their unique outputs. They will copy these files to their private testing subdirectory, either the one for the testCase class (for TestFilesMode.UniqueFolderPerTest mode) or the testCase test itself (for TestFilesMode.UniqueFolderPerTestClass mode).
public protocol InputFileCopyRequiringProtocol {

	static var folderMode: TestFilesMode {get}
	static var destinationParentFolder: URL {get}

//	static func getTestDatabaseDestinationParentFolder(testSubdir: String?) -> URL
//	static func getTestDatabaseLocations(testSubdir: String?) -> [URL]
//	static func getCompletelyNewDatabaseLocations(testSubdir: String?) -> [URL]
//
//	static func copyTestDatabases(testSubdir: String?) throws
//	static func clearCopiedTestDatabases(testSubdir: String?) throws


}

//public extension InputFileCopyRequiringProtocol where Self: XCTestCase {
//
//	static var destinationParentFolder: URL {
//		return URL(fileURLWithPath: "/Users/pho/Desktop/Testing DoseDatabaseLib/Active", isDirectory: true)
//	}
//
//	// dynamic (test-specific) versions
//	static func getTestDatabaseDestinationParentFolder(testSubdir: String?) -> URL {
//		let activeParentFolder: URL
//		if let validTestSubdir = testSubdir {
//			activeParentFolder = Self.destinationParentFolder.appendingPathComponent(validTestSubdir)
//		}
//		else {
//			activeParentFolder = Self.destinationParentFolder
//		}
//		return activeParentFolder
//	}
//
//
//	static func getTestDatabaseLocations(testSubdir: String?) -> [URL] {
//		let activeParentFolder: URL = getTestDatabaseDestinationParentFolder(testSubdir: testSubdir)
//		return Self.sourceDatabaseLocations.map({ activeParentFolder.appendingPathComponent($0.lastPathComponent) })
//	}
//
//	static func getCompletelyNewDatabaseLocations(testSubdir: String?) -> [URL] {
//		let activeParentFolder: URL = getTestDatabaseDestinationParentFolder(testSubdir: testSubdir)
//		return ["CompletelyNewDatabase"].map({ activeParentFolder.appendingPathComponent("\($0).sqlite3") })
//	}
//
//
//
//	static func copyTestDatabases(testSubdir: String?) throws {
//		// Put setup code here. This method is called before the invocation of each test method in the class.
//		let activeParentFolder: URL = getTestDatabaseDestinationParentFolder(testSubdir: testSubdir)
//		let fileMan = FileManager.init()
//		// Create the new directory if needed:
//		do {
//			try fileMan.createDirectory(at: activeParentFolder, withIntermediateDirectories: true, attributes: nil)
//		}
//		catch let error {
//			fatalError("error createDirectory: \(error)")
//			throw error
//		}
//
//
//		// Copy the items from the source urls to the destination urls:
//		let destUrls = getTestDatabaseLocations(testSubdir: testSubdir)
//		do {
//			for (index, aSourceFile) in Self.sourceDatabaseLocations.enumerated() {
//				let destinationUrl = destUrls[index]
//				try fileMan.copyItem(at: aSourceFile, to: destinationUrl)
//			}
//		}
//		catch let error {
//			fatalError("error copyItem: \(error)")
//			throw error
//		}
//	}
//
//
//	static func clearCopiedTestDatabases(testSubdir: String?) throws {
//		let activeParentFolder: URL = getTestDatabaseDestinationParentFolder(testSubdir: testSubdir)
//		let fileMan = FileManager.init()
//
//		do {
//			if (fileMan.fileExists(atPath: activeParentFolder.path)) {
//				try fileMan.removeItem(at: activeParentFolder)
//			}
//		}
//		catch let error {
//			fatalError("error removeItem: \(error)")
//			throw error
//		}
//
//		// remove any created new URLs
//		let removeNewUrls = getCompletelyNewDatabaseLocations(testSubdir: testSubdir)
//		for aRemoveUrl in removeNewUrls {
//			if (fileMan.fileExists(atPath: aRemoveUrl.path)) {
//				try fileMan.removeItem(at: aRemoveUrl)
//			}
//		}
//	}
//
//
//}

