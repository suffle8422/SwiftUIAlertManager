//
//  AlertManagerModifier.swift
//  SwiftUIAlertManager
//
//  Created by ionishi on 2024/12/21.
//

import SwiftUI

public struct AlertManagerModifier: ViewModifier {
    @Binding var alertManager: AlertManager

    public func body(content: Content) -> some View {
        content
            .alert(
                alertManager.title,
                isPresented: $alertManager.isPresented,
                actions: {
                    alertManager.buttons()
                },
                message: {
                    Text(alertManager.message)
                }
            )
    }
}

extension View {
    public func alertManager(_ alertManager: Binding<AlertManager>) -> some View {
        self.modifier(AlertManagerModifier(alertManager: alertManager))
    }
}
