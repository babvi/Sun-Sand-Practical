//
//  DetailViewController.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK:- IBOutlet
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    // MARK:- Variables
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}
