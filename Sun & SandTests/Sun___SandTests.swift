//___FILEHEADER___

import XCTest
@testable import Sun___Sand

class ___FILEBASENAMEASIDENTIFIER___: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// This will check, User array count must be 0 in beginning, there should be no default values
    func testEmptyUser() {
        let listViewModel = ListViewModel()
        XCTAssertEqual(listViewModel.userArray.value.count, 0, "There should no default user, user will come only from api.")
    }
    
    /// User detail must be empty during initialisation
    func testEmptyUserDetail() {
        let groupViewModel = DetailViewModel()
        XCTAssertNil(groupViewModel.userDetail.value)
    }

}
