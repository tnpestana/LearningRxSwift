//
//  BiometricHandler.swift
//  RxSwiftLogin
//
//  Created by BK Channels on 10/02/2020.
//  Copyright © 2020 Bankinter. All rights reserved.
//

import Foundation
import LocalAuthentication
import Security

struct BiometricHandler {
    func biometricAuthentication(completion: @escaping (Bool) -> ()) {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Confirmar identidade."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    completion(success)
                }
            }
        } else {
            completion(false)
        }
    }
    
    func returnKeyFromKeyChain() -> OSStatus {
        // Pesquisar se já existe uma chave com o propósito de autenticação biométrica
        var pubKey: SecKey? = nil
        var queryResult: AnyObject?
        let query = [
            kSecClass : kSecClassKey,
            kSecAttrKeyClass : kSecAttrKeyClassPublic,
            kSecAttrLabel : "personalPublicLabel",
            kSecReturnRef : kCFBooleanTrue!
        ] as CFDictionary
        let status: OSStatus = SecItemCopyMatching(query, &queryResult)
        return status
//        switch status {
//        case errSecSuccess:
//            pubKey = (queryResult as! SecKey)
//            return pubKey
//        case errSecItemNotFound:
//            generateKeyPair()
//            return nil
//        default:
//            return nil
//        }
    }
    
    let accessControlObject: SecAccessControl = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly, SecAccessControlCreateFlags(rawValue: SecAccessControlCreateFlags.biometryCurrentSet.rawValue | SecAccessControlCreateFlags.privateKeyUsage.rawValue), nil)!
    
    func generateKeyPair() {
        let publicKey: UnsafeMutablePointer<SecKey?>? = nil
        let privateKey: UnsafeMutablePointer<SecKey?>? = nil
        let privateKeyParameters = [
            kSecAttrLabel : "personalPrivateLabel",
            kSecAttrIsPermanent : kCFBooleanTrue as Any,
            kSecAttrAccessControl : accessControlObject
        ] as CFDictionary
        let keyPairParameters = [
            kSecAttrType : kSecAttrKeyTypeEC,
            kSecAttrKeySizeInBits : 256,
            kSecAttrTokenID : kSecAttrTokenIDSecureEnclave,
            kSecPrivateKeyAttrs : privateKeyParameters
        ] as CFDictionary
        let status = SecKeyGeneratePair(keyPairParameters, publicKey, privateKey)
        if status == errSecSuccess {
            storeKeyInKeyChain(publicKey)
        }
    }
    
    func storeKeyInKeyChain(_ key: UnsafeMutablePointer<SecKey?>?) {
        let itemAttributes = [
            kSecClass : kSecClassKey,
            kSecValueRef : key as Any,
            kSecAttrLabel : "personalPublicLabel",
            kSecAttrIsPermanent : kCFBooleanTrue as Any,
            kSecReturnData : kCFBooleanTrue as Any,
            kSecAttrKeyType : kSecAttrKeyTypeEC
        ] as CFDictionary
        _ = SecItemAdd(itemAttributes, nil)
    }
}
