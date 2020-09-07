//
//  DetailViewController.swift
//  ExternalDisplay
//
//  Created by Anders Borum on 27/08/2020.
//  Copyright © 2020 Anders Borum. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    private var externalWindow: UIWindow?
    
    @IBAction func toggleExternal(_ sender: Any) {
        if externalWindow != nil {
            teardownExternalScreen()
            return
        }
        
        if UIScreen.screens.count >= 2 {
            setupExternalScreen()
        }
    }
    
    private func setupExternalScreen() {
        guard let externalScene = SceneDelegate.externalWindowScene,
              let window = externalScene.windows.first else {
            return
        }
        
        configureAuxilliaryInterface(with: window)
        externalWindow = window
        window.isHidden = false // showing window disables mirroring
    }
    
    private func teardownExternalScreen() {
        self.externalWindow?.isHidden = true // enable mirroring
        self.externalWindow?.rootViewController = nil
        self.externalWindow = nil
    }
    
    private func configureAuxilliaryInterface(with window: UIWindow) {
        let vc = UIViewController()
        window.rootViewController = vc
        
        let imageView = UIImageView(image: UIImage(named: "800px-Amiga_500_plus"))
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.frame = vc.view.bounds
        vc.view.addSubview(imageView)
    }

}

