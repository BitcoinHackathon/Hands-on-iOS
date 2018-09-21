//
//  MockScripts.swift
//  BitcoinKit-HandsOn
//
//  Created by Akifumi Fujita on 2018/09/20.
//  Copyright © 2018年 Yenom. All rights reserved.
//

import Foundation
import BitcoinKit

// TODO: - 5. 単純な計算のScript
struct simpleCalculation {
    // lock script
    static let lockScript = try! Script()
    
    // unlock script builder
    static let unlockScriptBuilder: SingleKeyScriptBuilder = { (arg: (sig: Data, key: MockKey)) -> Script in
        let script = try! Script()
        return script
    }
}

// TODO: - 6. P2PKHのScript
struct P2PKH {
    // lock script
    static let lockScript = try! Script()
    
    // unlock script builder
    static let unlockScriptBuilder: SingleKeyScriptBuilder = { (arg: (sig: Data, key: MockKey)) -> Script in
        let (sig, key) = arg
        let script = try! Script()

        return script
    }
}

// TODO: - 7. 2 of 3 の MultisigのScript
struct Multisig2of3 {
    // lock script
    static let lockScript = try! Script()
    
    static let lockScript2 = Script(publicKeys: [MockKey.keyA.pubkey, MockKey.keyB.pubkey, MockKey.keyC.pubkey], signaturesRequired: 1)!
    
    // unlock script builder
    static let unlockScriptBuilder = { (pairs: [SigKeyPair]) -> Script in
        let script = try! Script()

        return script
    }
}

// TODO: 8. OP_IFを使ったScript
struct OPIF {
    // lock script
    static let lockScript = try! Script()
    
    // unlock script builder
    static let unlockScriptBuilder: SingleKeyScriptBuilder = { (arg: (sig: Data, key: MockKey)) -> Script in
        let (sig, key) = arg
        let script = try! Script()
    
        return script
    }
}
