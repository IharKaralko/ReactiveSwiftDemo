//
//  TestViewModel.swift
//  ReactiveSwiftDemo
//
//  Created by Ihar_Karalko on 14.02.2018.
//  Copyright © 2018 Ihar_Karalko. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

class TestViewModel{
    
    var textView = MutableProperty<String?>(nil)
    let justNumbers: Action<(String?), String, NoError>
    let justLetters: Action<(String?), String, NoError>
    
    init(){
        
        let validator = textView.map { text in
                return text?.characters.count ?? 0 > 0
        }
          self.justNumbers = Action(enabledIf: validator) { input in
            print("Submit with textView \(input ?? "o")")
            let newstring = input?.numbers
            return SignalProducer<String, NoError>(value: newstring!)
        }
        self.justLetters = Action(enabledIf: validator) { input in
            print("Submit with textView \(input ?? "o")")
            let string = input?.components(separatedBy: CharacterSet.decimalDigits).joined()
            return SignalProducer<String, NoError>(value: string!)
        }
        self.textView <~ self.justNumbers.values
        self.textView <~ self.justLetters.values
        
    }
}

extension String {
    var numbers: String {
        return String(characters.filter { "0"..."9" ~= $0 })
    }
}
