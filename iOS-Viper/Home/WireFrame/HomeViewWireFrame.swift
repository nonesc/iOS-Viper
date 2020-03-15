//
//  HomeViewWireFrame.swift
//  iOS-Viper
//
//  Created by Sujin on 11/3/2563 BE.
//  Copyright © 2563 Sujin. All rights reserved.
//

import UIKit

protocol HomeViewWireFrameProtocol {
    func onGoToFeedDetail(feed: Feed)
}

class HomeViewWireFrame: HomeViewWireFrameProtocol {

    class func createHome() -> HomeView {
        
        if let homeVC = HomeViewWireFrame.mainStoryBoard.instantiateViewController(withIdentifier: "HOME_CONTROLLER") as? HomeView {
            let presenter: HomeViewPresenterProtocol & HomeViewInteractorOutputsProtocol = HomeViewPresenter()
            let interactor: HomeViewInteractorProtocol = HomeViewInteractor()
            let router: HomeViewWireFrameProtocol = HomeViewWireFrame()
            homeVC.presenter = presenter
            presenter.interactor = interactor
            presenter.view = homeVC
            presenter.router = router
            interactor.presenter = presenter
            return homeVC
        }
        return HomeView()
    }

    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func onGoToFeedDetail(feed: Feed) {
        print(feed.name)
    }
}
