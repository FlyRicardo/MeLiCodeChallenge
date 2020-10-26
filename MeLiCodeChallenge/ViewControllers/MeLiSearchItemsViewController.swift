//
//  ViewController.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 17/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import UIKit

class MeLiSearchItemsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    public internal(set) var viewModel = MeLiSearchItemsViewModel()
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
      var recognizer = UITapGestureRecognizer(target:self, action: #selector(hideKeyboard))
      return recognizer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
        configureSearchBarApparence()
        configureTableView()
    }
    
    // MARK: Segue congifuration
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print()
    }
    
    //
    // MARK: - Private methods UISearchBar
    //
    @objc private func hideKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    private func configureSearchBarApparence() {
        if let textFieldInsideSearchBar = searchBar.value(forKey: KeyConstants.searchFieldKey) as? UITextField {
            textFieldInsideSearchBar.backgroundColor = .white
            textFieldInsideSearchBar.textColor = .darkGray
        }
    }
    
    //
    // MARK: - Private methods UITableView
    //
    func configureTableView() {
        let bundle = Bundle(for: MeLiViewCell.self)
        let nib = UINib(nibName: "MeLiViewCell", bundle: bundle)
        tableView.register(nib, forCellReuseIdentifier: MeLiViewCell.reuseIdentifier)
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
      return .topAttached
    }
}

//
// MARK: - Search bar delegate
//
extension MeLiSearchItemsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        hideKeyboard()
        
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        
        viewModel.executeSearchQuery(searchText){ [weak self] successful, error in
            if successful {
                self?.tableView.reloadData()
            }
            else {
                print(error)
            }
        }
        
//        let networkService = MeLiNetworkService()
//
//        //TODO: Use request builder blocks to handle the response or error
//        networkService.executeSearchQueryItemsCall(searchText) { [weak self] items, error in
//            if let _items = items as? [ItemsDTO] {
//                self?.searchItems = _items
//                self?.tableView.reloadData()
//            }
//            if !error.isEmpty {
//              print("Search error: " + error)
//            }
//        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
      view.addGestureRecognizer(tapRecognizer)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
      view.removeGestureRecognizer(tapRecognizer)
    }
}

//
// MARK: - TableView datasource
//
extension MeLiSearchItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchItems.count // viewModel.searchItems.coutn
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MeLiViewCell.reuseIdentifier,
                                                       for: indexPath) as? MeLiViewCell else {
            return UITableViewCell()
        }
        let item = viewModel.searchItems[indexPath.row]
        cell.configurationCell(item)
        return cell
    }
}

//
// MARK: - TableView delegate
//
extension MeLiSearchItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.searchItems[indexPath.row]

        if let viewController = storyboard?.instantiateViewController(identifier: "MeLiItemDetailViewController") as? MeLiItemDetailViewController {
            viewController.itemDetailViewModel = item
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

private extension MeLiSearchItemsViewController {
    struct Constants {
        static let tableViewCellHeight = CGFloat(100)
    }
    
    struct KeyConstants {
        static let searchFieldKey = "searchField"
    }
}

