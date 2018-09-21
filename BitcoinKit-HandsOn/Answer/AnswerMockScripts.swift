//
//  AnswerMockScripts.swift
//  BitcoinKit-HandsOn
//
//  Created by Akifumi Fujita on 2018/09/20.
//  Copyright © 2018年 Yenom. All rights reserved.
//

import Foundation
import BitcoinKit

struct answerSimpleCalculation {
    // lock script
    static let lockScript = try! Script()
        .append(.OP_2)
        .append(.OP_3)
        .append(.OP_ADD)
        .append(.OP_EQUAL)
    
    // unlock script builder
    static let unlockScriptBuilder: SingleKeyScriptBuilder = { (arg: (sig: Data, key: MockKey)) -> Script in
        let script = try! Script()
            .append(.OP_5)
        return script
    }
}

struct answerP2PKH {
    // lock script
    static let lockScript = try! Script()
        .append(.OP_DUP)
        .append(.OP_HASH160)
        .appendData(MockKey.keyA.pubkeyHash)
        .append(.OP_EQUALVERIFY)
        .append(.OP_CHECKSIG)
    
    // unlock script builder
    static let unlockScriptBuilder: SingleKeyScriptBuilder = { (arg: (sig: Data, key: MockKey)) -> Script in
        let (sig, key) = arg
        let script = try! Script()
            .appendData(sig)
            .appendData(key.pubkey.data)
        return script
    }
}

struct answerMultisig2of3 {
    // lock script
    static let lockScript = try! Script()
        .append(.OP_2)
        .appendData(MockKey.keyA.pubkey.data)
        .appendData(MockKey.keyB.pubkey.data)
        .appendData(MockKey.keyC.pubkey.data)
        .append(.OP_3)
        .append(.OP_CHECKMULTISIG)
    
    static let lockScript2 = Script(publicKeys: [MockKey.keyA.pubkey, MockKey.keyB.pubkey, MockKey.keyC.pubkey], signaturesRequired: 1)!
    
    // unlock script builder
    static let unlockScriptBuilder = { (pairs: [SigKeyPair]) -> Script in
        let script = try! Script()
            .append(.OP_0)
        for pair in pairs {
            try! script.appendData(pair.sig)
        }
        return script
    }
}

struct answerOPIF {
    // lock script
    static let lockScript = try! Script()
        .append(.OP_IF)
            .append(.OP_DUP)
            .append(.OP_HASH160)
            .appendData(MockKey.keyA.pubkeyHash)
        .append(.OP_ELSE)
            .append(.OP_DUP)
            .append(.OP_HASH160)
            .appendData(MockKey.keyB.pubkeyHash)
        .append(.OP_ENDIF)
        .append(.OP_EQUALVERIFY)
        .append(.OP_CHECKSIG)
    
    // unlock script builder
    static let unlockScriptBuilder: SingleKeyScriptBuilder = { (arg: (sig: Data, key: MockKey)) -> Script in
        let (sig, key) = arg
        let script = try! Script()
            .appendData(sig)
            .appendData(key.pubkey.data)
            .append(.OP_TRUE)
        
        return script
    }
}
