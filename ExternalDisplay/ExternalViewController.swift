//
//  ExternalViewController.swift
//  ExternalDisplay
//
//  Created by Anders Borum on 07/09/2020.
//  Copyright © 2020 Anders Borum. All rights reserved.
//

import UIKit

class ExternalViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // hiding window turns on mirroring
        view.window?.isHidden = false
    }
}
