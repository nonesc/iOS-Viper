//
//  HomeViewProtocols.swift
//  iOS-Viper
//
//  Created by Sujin on 11/3/2563 BE.
//  Copyright © 2563 Sujin. All rights reserved.
//

import Foundation
protocol HomeViewInteractorOutputsProtocol: class {
    func didFinishLoadingFeed(feed: [Feed])
}


protocol HomeViewInteractorProtocol: class {
    var presenter: HomeViewInteractorOutputsProtocol? { get set }
    func fetchHomeFeed()
}

protocol HomeViewProtocol: class {
    func reloadHomeFeed(feed: [Feed])
}

