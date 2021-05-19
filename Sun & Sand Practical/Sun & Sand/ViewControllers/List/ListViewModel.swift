//
//  ListViewModel.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import Foundation

class ListViewModel {
    
    // MARK:- Observable Variables
    let userArray: Observable<[User]> = .init([])
    let isLoading: Observable<Bool> = .init(false)
    let currentPage: Observable<Int> = .init(0)
    let errorMessage: Observable<String?> = .init(nil)
    
    // MARK:- Constant Variable
    private let RECORD_PER_PAGE = 20
    
    init() {
        
    }
    
}

// MARK:- Network Management
extension ListViewModel {
    
    /// This function is used to fetch user records
    func getUserRecords() {
        // Start loading
        isLoading.value = true
        
        // API Call
        NetworkManager.shared.get(stringUrl: AppUrls.getUsers(page: currentPage.value, numberOfRecord: RECORD_PER_PAGE)) { [weak self] (response: BaseModel<[User]>?, error: CustomError?) in
            guard let `self` = self else {
                return
            }
            
            func stopLoading() {
                // Stop loading
                self.isLoading.value = false
            }
            
            // Response validation
            guard let users = response?.results, users.count > 0, error == nil else{
                self.errorMessage.value = error?.errorDescription
                stopLoading()
                return
            }
            self.currentPage.value == 0 ? (self.userArray.value = users) : (self.userArray.value.append(contentsOf: users))
            stopLoading()
        }
    }
}
