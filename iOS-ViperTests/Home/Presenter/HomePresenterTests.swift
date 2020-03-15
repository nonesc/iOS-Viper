//
//  HomePresenterTests.swift
//  iOS-ViperTests
//
//  Created by Sujin Chaichanamongkol on 15/3/2563 BE.
//  Copyright © 2563 Sujin. All rights reserved.
//

import XCTest
@testable import iOS_Viper

class HomePresenterTests: XCTestCase {

    var presenter: (HomeViewPresenterProtocol & HomeViewInteractorOutputsProtocol)?
    var interactor: TestInteractor?
    var router: TestRouter?
    var view: TestView?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = HomeViewPresenter()
        interactor = TestInteractor()
        router = TestRouter()
        view = TestView()
        presenter?.interactor = interactor
        presenter?.router = router
        presenter?.view  = view
        interactor?.presenter = presenter
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSelectFeed() {
        let feed = Feed(name: "asd", desc: "asd")
        presenter?.onSelectFeed(feed: feed)
        XCTAssert(router?.isGoToFeed == true)
    }
    
    func testFinishLoadFeedSuccess() {
        presenter?.onViewDidLoad()
        XCTAssert(view?.isReloadHomeTrigger == true)
    }
}

extension HomePresenterTests {
    
    class TestInteractor: HomeViewInteractorProtocol {
        var presenter: HomeViewInteractorOutputsProtocol?
        
        func fetchHomeFeed() {
            presenter?.didFinishLoadingFeed(feed: [Feed(name: "asd", desc: "dsa")])
        }
    }
    
    class TestRouter: HomeViewWireFrameProtocol {
        var isGoToFeed: Bool = false
        func onGoToFeedDetail(feed: Feed) {
            isGoToFeed = true
        }
    }
    
    class TestView: HomeViewProtocol {
        var isReloadHomeTrigger: Bool = false
        func reloadHomeFeed(feed: [Feed]) {
            isReloadHomeTrigger = true
        }
    }
}
