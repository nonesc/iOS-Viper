//
//  HomeViewPresenter.swift
//  iOS-Viper
//
//  Created by Sujin on 11/3/2563 BE.
//  Copyright © 2563 Sujin. All rights reserved.
//

import Foundation

class HomeViewPresenter: HomeViewPresenterProtocol {

    var interactor: HomeViewInteractorProtocol?
    weak var view: HomeViewProtocol?

    func onViewDidLoad() {
        interactor?.fetchHomeFeed()
    }
}

extension HomeViewPresenter: HomeViewInteractorOutputsProtocol {
    func didFinishLoadingFeed(feed: [Feed]) {
        view?.reloadHomeFeed(feed: feed)
    }
}
