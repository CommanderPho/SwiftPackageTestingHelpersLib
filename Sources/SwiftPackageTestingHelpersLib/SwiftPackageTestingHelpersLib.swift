public enum ResetsFilesAfterTests {
	case ResetAll
	case KeepAll
}

public enum TestFilesMode {
	case UniqueFolderPerTest
	case UniqueFolderPerTestClass
	case SharedFolder
}




struct SwiftPackageTestingHelpersLib {
    var text = "Hello, World!"
}
