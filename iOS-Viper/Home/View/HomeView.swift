//
//  HomeView.swift
//  iOS-Viper
//
//  Created by Sujin on 11/3/2563 BE.
//  Copyright © 2563 Sujin. All rights reserved.
//

//import Foundation
import UIKit
class HomeView: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var feed: [Feed] = [] {
        didSet {
            print(feed.count)
        }
    }
    var presenter: HomeViewPresenterProtocol?

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HOME_CELL")
        tableView.tableFooterView = UIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.onViewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    func reloadHomeFeed(feed: [Feed]) {
        self.feed = feed
        tableView.reloadData()
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "HOME_CELL", for: indexPath) as? HomeTableViewCell {
//            let feed = self.feed[indexPath.row]
//            cell.feedNameLabel.text = feed.name
//            return cell
//        }
        let cell = UITableViewCell(style: .default, reuseIdentifier: "HOME_CELL")
        cell.backgroundColor = .red
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
}

protocol HomeViewPresenterProtocol: class {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeViewInteractorProtocol? { get set }
    func onViewDidLoad()
}
