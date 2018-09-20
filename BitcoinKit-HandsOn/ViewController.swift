//
//  ViewController.swift
//  BitcoinKit-HandsOn
//
//  Created by Akifumi Fujita on 2018/09/20.
//  Copyright © 2018年 Yenom. All rights reserved.
//

import UIKit
import BitcoinKit

class ViewController: UIViewController {
    @IBOutlet weak var qrCodeImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet private weak var destinationAddressTextField: UITextField!
    
    private var wallet: Wallet?  = Wallet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createWalletIfNeeded()
        //updateLabels()
        
        //testMockScript()
    }
    
    func createWalletIfNeeded() {
        if wallet == nil {

        }
    }
    
    func updateLabels() {

//        if let balance = wallet?.balance() {
//            balanceLabel.text = "Balance : \(balance) satoshi"
//        }
    }
    
    func updateBalance() {

    }
    
    func testMockScript() {
        do {
            let result = try MockHelper.verifySingleKey(lockScript: simpleCalculation.lockScript, unlockScriptBuilder: simpleCalculation.unlockScriptBuilder, key: MockKey.keyA)
            
            //let result = try MockHelper.verifySingleKey(lockScript: P2PKH.lockScript, unlockScriptBuilder: P2PKH.unlockScriptBuilder, key: MockKey.keyA)
            
            //let result = try MockHelper.verifyMultiKey(lockScript: Multisig2of3.lockScript, unlockScriptBuilder: Multisig2of3.unlockScriptBuilder, keys: [MockKey.keyA, MockKey.keyB], verbose: true)
            print("Mock result: \(result)")
        } catch let error {
            print("Mock result: \(error)")
        }
    }
    
    @IBAction func didTapReloadBalanceButton(_ sender: UIButton) {
        updateBalance()
    }
    
    @IBAction func didTapSendButton(_ sender: UIButton) {
        guard let addressString = destinationAddressTextField.text else {
            return
        }
        
        do {

        } catch {
            print(error)
        }
    }
}



