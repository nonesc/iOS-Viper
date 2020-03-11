//
//  HomeViewInteractor.swift
//  iOS-Viper
//
//  Created by Sujin on 11/3/2563 BE.
//  Copyright © 2563 Sujin. All rights reserved.
//

import Foundation

class HomeViewInteractor: HomeViewInteractorProtocol {

    weak var presenter: HomeViewInteractorOutputsProtocol?

    func fetchHomeFeed() {
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.presenter?.didFinishLoadingFeed(feed: [Feed(name: "feed 1", desc: "feed 1 desc")])
//        }
    }
}
