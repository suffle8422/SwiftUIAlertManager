//
//  AlertManager.swift
//  SwiftUIAlertManager
//
//  Created by ionishi on 2024/12/21.
//

import SwiftUI
import Observation

@MainActor
@Observable
public final class AlertManager {
    // アラート内の処理で再度アラートを出すと、表示後にすぐフラグがoffになるためアラートが表示されない
    // フラグ2つを交互に利用することでこれを防ぐ
    public var isPresented1 = false
    public var isPresented2 = false
    var title: String = ""
    var message: String = ""
    var buttons: () -> AnyView = { AnyView(EmptyView()) }

    public init() {}

    /// タイトル・メッセージ・ボタンを指定してアラートを表示
    public func showAlert(
        title: String = "",
        message: String = "",
        buttons: @escaping () -> any View = { AnyView(EmptyView()) }
    ) {
        self.title = title
        self.message = message
        self.buttons = { AnyView(buttons()) }

        if isPresented1 {
            isPresented2 = true
        } else {
            isPresented1 = true
        }
    }

    /// LocalizedErrorからアラートを表示する
    public func showErrorAlert(error: any LocalizedError) {
        self.title = ""
        self.message = error.localizedDescription
        self.buttons = { AnyView(EmptyView()) }

        if isPresented1 {
            isPresented2 = true
        } else {
            isPresented1 = true
        }
    }
}
