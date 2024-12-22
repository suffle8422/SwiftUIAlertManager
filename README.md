# SwiftUIAlertManager

## about SwiftUIAlertManager
SwiftUIAlertManagerは、SwiftUIのalertModifierをより簡潔に利用するためのライブラリです。

## Installation
Swift Package Managerよりインストールしてください
Package.swiftファイルからインストールする場合には以下のように設定をお願いします。
```Swift
let package = Package(
    name: "SomeProduct",
    products: [
        .library(name: "SomeProduct", targets: ["SomeProduct"])
    ],
    dependencies: [
        .package(url: "https://github.com/suffle8422/SwiftUIAlertManager.git", exact: "0.1.0")
    ],
    targets: [
        .target(
            name: "SomeProduct",
            dependencies: [
                .product(name: "SwiftUIAlertManager", package: "SwiftUIAlertManager")
            ]
        )
    ]
)
```

## Usage
1. 任意のViewもしくはObservableなオブジェクトに、AlertManagerクラスのインスタンスを生成する
```Swift
import SwiftUIAlertManager

@MainActor
@Observable
final class SampleViewModel {
    var alertManager = AlertManager()
}
```

2. アラートを表示するViewにalertManagerモディファイアをつける
```Swift
import SwiftUIAlertManager

struct SampleView: View {
    @State var viewModel = SampleViewModel()

    var body: some View {
        VStack {
            Text("Sample View")
        }
        .alertManager($viewModel.alertManager)
    }
}
```

3. アラートを表示するタイミングで関数を呼び出す
```Swift
import SwiftUIAlertManager

struct SampleView: View {
    @State var viewModel = SampleViewModel()

    var body: some View {
        VStack {
            Text("Sample View")
            Button("通常アラート") {
                viewModel.alertManager.showAlert(
                    title: "通常アラート",
                    message: "通常のアラートです"
                    buttons: {
                        Button("OK") {
                            debugPrint("on Tap OK Button")
                        }
                    }
                )
            }
            Button("エラーアラート") {
                viewModel.alertManager.showErrorAlert(error: SampleError.hogeError)
            }
        }
        .alertManager($viewModel.alertManager)
    }

    enum SampleError: Error, localizedError {
        case hogeError

        var errorDescription: String? {
            switch self {
                case .hogeError: "hogeErrorが発生しました"
            }
        }
    }
}
```