//
//  AppDelegate.swift
//  Peibufo
//
//  Created by Débora Oliveira on 27/12/20.
//  Copyright © 2020 Débora Oliveira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
//    Um app onde eu consiga fazer um grupo referente a uma viagem e adicionar quem pessoas a ele. Ai vou anotando se alguém pagar uma coisa pra todo mundo. O app já iria dividir esse gasto entre o número de pessoas da viagem. No final sairia quanto cada um precisa pagar ou receber entre os amigos. Eu poderia adicionar o que foi a compra, o valor e quem pagou, talvez até forma de pagamento, e hora que foi. Seria legal que quem tivesse o app instalado e participando da viagem conseguisse acompanhar em tempo real isso e adicionar compras também. Um histórico das adições tbm seria legal. No final eu poderia arquivar ou deletar essa viagem. Uma forma massa de monetizar seria poder criar só uma viagem por vez, ou ter um número limitado de amigos que podem ser adicionados. Pagar pelo próprio app seria topissimo.


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

