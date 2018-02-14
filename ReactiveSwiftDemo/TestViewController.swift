//
//  TestViewController.swift
//  ReactiveSwiftDemo
//
//  Created by Ihar_Karalko on 14.02.2018.
//  Copyright © 2018 Ihar_Karalko. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result
import ReactiveCocoa

class TestViewController: UIViewController {
    
    var viewModel: TestViewModel = TestViewModel()
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var justNumbers: UIButton!
    @IBOutlet weak var justLetters: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.reactive.text <~ viewModel.textView
        viewModel.textView <~ textView.reactive.continuousTextValues
        self.justNumbers.reactive.pressed = CocoaAction(self.viewModel.justNumbers) { [weak self] (button) -> (String?) in
            return (self?.textView.text)
        }
        self.justLetters.reactive.pressed = CocoaAction(self.viewModel.justLetters) { [weak self] (button) -> (String?) in
            return (self?.textView.text)
        }
      }
}
