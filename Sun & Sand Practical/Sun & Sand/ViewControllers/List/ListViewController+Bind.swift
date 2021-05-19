//
//  ListViewController+Bind.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import Foundation

extension ListViewController {
    
    func bind() {
        
        viewModel.userArray.bind { [weak self] _ in
            guard let `self` = self else {
                return
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        viewModel.errorMessage.bind { [weak self] (errorMessage) in
            guard let `self` = self, let message = errorMessage, message.count > 0 else {
                return
            }
            
            DispatchQueue.main.async {
                self.errorMessage.text = message
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.errorMessage.removeFromSuperview()
            }
            print(message)
        }
        
        viewModel.isLoading.bindAndNotify { [weak self] (isLoading) in
            guard let `self` = self else {
                return
            }
            DispatchQueue.main.async {
                isLoading == true ? (self.loader.startAnimating()) : (self.loader.stopAnimating())
            }
        }
        
        viewModel.currentPage.bindAndNotify { [weak self] (page) in
            guard let `self` = self else {
                return
            }
            self.viewModel.getUserRecords()
        }
    }
    
}
