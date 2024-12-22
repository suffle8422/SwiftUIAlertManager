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
    public var isPresented = false
    var title: String = ""
    var message: String = ""
    var buttons: () -> AnyView = { AnyView(EmptyView()) }

    /// タイトル・メッセージ・ボタンを指定してアラートを表示
    public func showAlert(
        title: String = "",
        message: String = "",
        buttons: @escaping () -> any View = { AnyView(EmptyView()) }
    ) {
        self.title = title
        self.message = message
        self.buttons = { AnyView(buttons()) }

        isPresented = true
    }

    public func showErrorAlert(error: any LocalizedError) {
        self.title = ""
        self.message = error.localizedDescription
        self.buttons = { AnyView(EmptyView()) }

        isPresented = true
    }
}
