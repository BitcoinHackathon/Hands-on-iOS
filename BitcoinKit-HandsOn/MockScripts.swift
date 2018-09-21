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
    struct UnlockScriptBuilder: MockUnlockScriptBuilder {
        func build(pairs: [SigKeyPair]) -> Script {
            let script = try! Script()
            return script
        }
    }
}

// TODO: - 6. P2PKHのScript
struct P2PKH {
    // lock script
    static let lockScript = try! Script()
    
    // unlock script builder
    struct UnlockScriptBuilder: MockUnlockScriptBuilder {
        func build(pairs: [SigKeyPair]) -> Script {
            guard let signature = pairs.first?.signature else {
                return Script()
            }
            
            let script = try! Script()
            return script
        }
    }
}

// TODO: - 7. 2 of 3 の MultisigのScript
struct Multisig2of3 {
    // lock script
    static let lockScript = try! Script()
    
    // unlock script builder
    struct UnlockScriptBuilder: MockUnlockScriptBuilder {
        func build(pairs: [SigKeyPair]) -> Script {
            let script = try! Script().append(.OP_0)
            pairs.forEach { try! script.appendData($0.signature) }
            return script
            
        }
    }
}

// TODO: - 8. P2SH形式のMultisig
struct P2SHMultisig {
    // lock script
    static let redeemScript = Script(publicKeys: [MockKey.keyA.pubkey, MockKey.keyB.pubkey, MockKey.keyC.pubkey], signaturesRequired: 1)!
    
    static let lockScript = try! Script()
        .append(.OP_HASH160)
        .appendData(Crypto.sha256ripemd160(redeemScript.data))
        .append(.OP_EQUAL)
    
    // unlock script builder
    struct UnlockScriptBuilder: MockUnlockScriptBuilder {
        func build(pairs: [SigKeyPair]) -> Script {
            guard let signature = pairs.first?.signature else {
                return Script()
            }
            
            let script = try! Script()
                .append(.OP_0)
                .appendData(signature)
                .appendData(redeemScript.data)
            return script
        }
    }
}

// TODO: 9. OP_IFを使ったScript
struct OPIF {
    // lock script
    static let lockScript = try! Script()
    
    // unlock script builder
    struct UnlockScriptBuilder: MockUnlockScriptBuilder {
        func build(pairs: [SigKeyPair]) -> Script {
            guard let signature = pairs.first?.signature else {
                return Script()
            }
            
            let script = try! Script()
            return script
        }
    }
}
