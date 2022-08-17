//
//  ViewController.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//

import Combine
import Foundation
import UIKit

class ListViewController: BaseViewController<MainListVM> {
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = UITableView.automaticDimension
            tableView.keyboardDismissMode = .onDrag
        }
    }
     
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        setupCells()
        setupSearchView()
        viewModel = MainListVM()
        if let repo = searchController.searchBar.text {
            viewModel?.getData(searchRepo: repo)
        }
        viewModel?.$apiResponse.dropFirst().sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }.store(in: &bag)
        
        viewModel?.$isLoading.dropFirst().sink { [weak self] val in
            self?.showLoader(show: val)
        }.store(in: &bag)
        
        super.viewDidLoad()
    }
    
    /// register cell within the table view
    func setupCells() {
        tableView.register(UINib(nibName: ListTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ListTableViewCell.nibName)
    }
    
    func setupSearchView() {
        // Setup the Search Controller
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Enter username/repo"
        searchController.searchBar.text = "MuraliSoft/EmbibeDemo"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let searchStr = searchBar.text, !searchStr.isEmpty {
            viewModel?.getData(searchRepo: searchStr.trimed)
        }
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (viewModel?.apiResponse?.count ?? 0) == 0 {
            self.tableView.setEmptyMessage("No results found")
        } else {
            self.tableView.restore()
        }
        return viewModel?.apiResponse?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.nibName) as? ListTableViewCell {
            cell.config(data: viewModel?.apiResponse?.getSafe(at: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
