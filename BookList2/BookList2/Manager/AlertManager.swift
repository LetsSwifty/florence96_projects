//
//  Alert.swift
//  BookList2
//
//  Created by Yejin Hong on 2022/05/08.
//

import Foundation
import UIKit

func alertWithOK(vc: UIViewController?, message: String?, handler: @escaping () -> Void){
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "확인", style: .default) { _ in
        handler()
    }
    
    alert.addAction(ok)
    alert.view.tintColor = .black
    
    vc?.present(alert, animated: true)
}

func alertWithOKandCancel(vc: UIViewController?, message: String?, handler: @escaping () -> Void){
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "확인", style: .default) { _ in
        handler()
    }
    let cancel = UIAlertAction(title: "취소", style: .default, handler: nil)
    
    alert.addAction(ok)
    alert.addAction(cancel)
    alert.view.tintColor = .black
    
    vc?.present(alert, animated: true)
}
