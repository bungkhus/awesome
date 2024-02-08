//
//  UIViewController+Extension.swift
//  Awesome
//
//  Created by Lion Parcel on 08/02/24.
//

import UIKit

extension UIViewController {
    
    func push(to vc: UIViewController) {
        if let navVc = self as? UINavigationController {
            navVc.pushViewController(vc, animated: true)
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func present(to vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
