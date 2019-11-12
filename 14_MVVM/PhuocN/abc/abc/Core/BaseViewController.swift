//
//  BaseViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit
import GoogleSignIn
import GoogleAPIClientForREST

class BaseViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate  {
    
    private let scopes = [kGTLRAuthScopeYouTubeReadonly, kGTLRAuthScopeYouTubeForceSsl, kGTLRAuthScopeYouTube, kGTLRAuthScopeYouTubeYoutubepartner]
    private let service = GTLRYouTubeService()
    private let signInButton = GIDSignInButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = scopes
        GIDSignIn.sharedInstance().signInSilently()
        setupUI()
    }
    
    func setupUI() {
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = signInButton
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func loadData() {}
    
    //func updateUI() {}
    
    //MARK: -Alert
    func showErrorAlert(with message: String) {
        //self.homeCollectionView.refreshControl?.endRefreshing()
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            showAlert(title: "Authentication Error", message: error.localizedDescription)
            self.service.authorizer = nil
        } else {
            self.service.authorizer = user.authentication.fetcherAuthorizer()
            fetchChannelResource()
            UserDefaults.standard.set(user.authentication.accessToken, forKey: "youtubeAccessToken")
        }
    }
    
    func fetchChannelResource() {
        let query = GTLRYouTubeQuery_ChannelsList.query(withPart: "snippet,statistics")
        query.identifier = "UC_x5XG1OV2P6uZZ5FSM9Ttw"
        // To retrieve data for the current user's channel, comment out the previous
        // line (query.identifier ...) and uncomment the next line (query.mine ...)
        // query.mine = true
        service.executeQuery(query,
                             delegate: self,
                             didFinish: #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))
    }
    
    // Process the response and display output
    @objc func displayResultWithTicket(
        ticket: GTLRServiceTicket,
        finishedWithObject response : GTLRYouTube_ChannelListResponse,
        error : NSError?) {
        
        if let error = error {
            showAlert(title: "Error", message: error.localizedDescription)
            return
        }
        navigationItem.rightBarButtonItem = nil
    }
    
    
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
