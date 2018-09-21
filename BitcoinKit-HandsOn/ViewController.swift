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
        updateLabels()
        
        //testMockScript()
    }
    
    func createWalletIfNeeded() {
        if wallet == nil {
            // TODO: - 1. Walletの作成
            // TODO: 1-1. Private Keyの生成
            // let privateKey: PrivateKey = "WRITE ME"
            
            // TODO: 1-2. Walletの生成
            // wallet = "WRITE ME"
            
            // TODO: 1-3. Walletの保存
            // wallet?."WRITE ME"
        }
    }
    
    func updateLabels() {
        // TODO: - 2. Addressの表示
        // TODO: 2-1. Addressのprint
        // print("WRITE ME")
        // TODO: 2-2. Addressを表示
        // addressLabel.text = "WRITE ME"
        // TODO: 2-3. AddressのQRCodeを表示
        // qrCodeImageView.image = "WRITE ME"
        
        
        // TODO: - 3. Balanceの表示
        // TODO: 3-1. Balanceの表示
        // let balance: UInt64 = "WRITE ME"
        // balanceLabel.text = "Balance : \(balance) satoshi"
    }
    
    func reloadBalance() {
        // TODO: 3-2. Balanceの更新
        // "WRITE ME"
    }
    
    @IBAction func didTapReloadBalanceButton(_ sender: UIButton) {
        reloadBalance()
    }
    
    @IBAction func didTapSendButton(_ sender: UIButton) {
        guard let addressString = destinationAddressTextField.text else {
            return
        }

        do {
            // TODO: - 4. 送金する
            // TODO: 4-1. アドレスの生成
            // let address: Address = "WRITE ME"
            
            // TODO: 4-2. ウォレットから送金 [送金完了後、reloadBalanceもやろう！]
            // WRITE ME!
        } catch {
            print(error)
        }
    }
}



// MARK: - Hello, Bitcoin Script!以降で使用します
func testMockScript() {
    do {
        let result1 = try MockHelper.verifySingleKey(lockScript: simpleCalculation.lockScript, unlockScriptBuilder: simpleCalculation.unlockScriptBuilder, key: MockKey.keyA)
        print("Mock result1: \(result1)")

        //let result2 = try MockHelper.verifySingleKey(lockScript: P2PKH.lockScript, unlockScriptBuilder: P2PKH.unlockScriptBuilder, key: MockKey.keyA)
        //print("Mock result2: \(result2)")

        //let result3 = try MockHelper.verifyMultiKey(lockScript: Multisig2of3.lockScript, unlockScriptBuilder: Multisig2of3.unlockScriptBuilder, keys: [MockKey.keyA, MockKey.keyB], verbose: true)
        //print("Mock result3: \(result3)")
    } catch let error {
        print("Mock Script Error: \(error)")
    }
}

