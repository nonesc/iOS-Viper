//
//  HomeViewWireFrame.swift
//  iOS-Viper
//
//  Created by Sujin on 11/3/2563 BE.
//  Copyright © 2563 Sujin. All rights reserved.
//

import UIKit
class HomeViewWireFrame {

    class func createHome() -> HomeView {
        
        if let homeVC = HomeViewWireFrame.mainStoryBoard.instantiateViewController(withIdentifier: "HOME_CONTROLLER") as? HomeView {
            let presenter: HomeViewPresenterProtocol & HomeViewInteractorOutputsProtocol = HomeViewPresenter()
            let interactor: HomeViewInteractorProtocol = HomeViewInteractor()
            homeVC.presenter = presenter
            presenter.interactor = interactor
            presenter.view = homeVC
            interactor.presenter = presenter
            return homeVC
        }
        return HomeView()
    }

    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
