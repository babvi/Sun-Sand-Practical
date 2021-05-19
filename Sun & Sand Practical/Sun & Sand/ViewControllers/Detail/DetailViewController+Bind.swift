//
//  DetailViewController+Bind.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import Foundation

extension DetailViewController {
    
    func bind() {
        
        viewModel.userDetail.bindAndNotify { [weak self] (user) in
            guard let `self` = self, let user = user else{
                return
            }
            
            self.imageView.downloadImage(with:user.largeString, placeholder: "placeholder")
            
            self.nameLabel.text = user.fullName
            self.ageLabel.text = "\(user.dob?.date ?? "")"
            self.phoneLabel.text = user.phone ?? ""
            self.addressLabel.text = user.address
        }
        
    }

}
