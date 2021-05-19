//
//  ListViewController.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import UIKit

class ListViewController: UIViewController {

    // MARK:- IBOutlet
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            guard let tableView = tableView else {
                return
            }
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView( style: .large)
        loader.center = self.view.center
        loader.hidesWhenStopped = true
        self.view.addSubview(loader)
        return loader
    }()
    
    lazy var errorMessage: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: self.view.bounds.height - self.view.safeAreaInsets.bottom - 90, width: UIScreen.main.bounds.width - 40, height: 70)
        label.numberOfLines = 0
        label.backgroundColor = .black
        label.textColor = .white
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User List"
        bind()
        // Do any additional setup after loading the view.
    }
}

// MARK:- TableView DataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userArray.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UserCell")
        
        let user = viewModel.userArray.value[indexPath.row]
        cell.textLabel?.text = user.fullName
        cell.detailTextLabel?.text = user.gender
        
        cell.imageView?.downloadImage(with: user.thumbNailString, placeholder: "placeholder")
        
        return cell
    }
}

// MARK:- TableView Delegate
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.userArray.value.count - 1) && viewModel.isLoading.value == false {
            viewModel.currentPage.value += 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        if let controller = self.storyboard?.instantiateViewController(identifier: String(describing: DetailViewController.self)) as? DetailViewController {
            controller.viewModel.userDetail.value = viewModel.userArray.value[indexPath.row]
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
