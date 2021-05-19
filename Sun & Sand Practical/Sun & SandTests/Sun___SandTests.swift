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
    
    /// Necessary details must not be empty
    func testCheckMandatoryFieldValue() {
        NetworkManager.shared.get(stringUrl: AppUrls.getUsers(page: 0, numberOfRecord: 50)) { (response: BaseModel<[User]>?, error: CustomError?) in
            guard let users = response?.results else {
                return
            }
            for user in users {
                XCTAssertNotNil(user.name?.first, "First name should not be null")
                XCTAssertNotNil(user.name?.last, "Last name should not be null")
                XCTAssertNotNil(user.gender, "Gender should not be null")
            }
        }
    }
    
    /// Check whether placeholder is empty or not
    func testCheckPlaceholderImage() {
        XCTAssertNotNil(UIImage(named: "placeholder"), "Placeholder image is not exists")
    }
    
    /// Checking first viewcontroller must be List view controller.
    func testStartingViewController() {
        if let navController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? UINavigationController, let controller = navController.viewControllers.first {
            XCTAssertTrue(((controller as? ListViewController) != nil), "First controller must be list view controller")
        }
    }
}
