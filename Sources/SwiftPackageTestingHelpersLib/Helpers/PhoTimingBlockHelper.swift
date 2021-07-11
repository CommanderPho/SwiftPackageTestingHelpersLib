//
//  PhoTimingBlockHelper.swift
//  TestAppleNotesFramework
//
//  Created by Pho Hale on 7/7/21.
//  Copyright © 2021 Pho Hale. All rights reserved.
//

import Foundation


////////////////////////////////////////////////////////////////////
//MARK: -
//MARK: - Code Profiling/Timing Functions


// MARK: -
// MARK: - struct PhoTimingBlockHelper
// Description: Times the execution of code until .end is called.
/* Usage:
	var activeBlockObj = PhoTimingBlockHelper(blockName: "yourBlockName")
	/*
		// Do whatever you want here!
	*/
	activeBlockObj.end() // finishes the block and prints the results
*/
public struct PhoTimingBlockHelper {
	public var startTime = CFAbsoluteTimeGetCurrent()
	public var blockName: String
	public var endTime: CFAbsoluteTime!
	public var executionTime: CFAbsoluteTime {
		return self.endTime - self.startTime
	}

	public mutating func end() {
		if (self.endTime != nil) {
			fatalError("This block has already had end() called on it! Is there a mistake?")
		}
		self.endTime = CFAbsoluteTimeGetCurrent()
		print("\(self.blockName): \(self.executionTime) seconds")
	}

	public init(startTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent(), blockName: String, endTime: CFAbsoluteTime? = nil) {
		self.startTime = startTime
		self.blockName = blockName
		self.endTime = endTime
	}
}





