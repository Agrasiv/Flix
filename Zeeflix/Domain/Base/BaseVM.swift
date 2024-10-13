//
//  BaseVM.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation

class BaseVM {
    var loading: ((Bool) -> Void)?
    var error: ((String) -> Void)?
}
