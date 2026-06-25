// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "BTImagePicker",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "BTImagePicker",
            targets: ["BTImagePickerWrapper", "BTImagePickerCommonResources"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.0"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "BTImagePickerWrapper",
            dependencies: [
                .product(name: "UnityBridge", package: "UnityBridge"),
            ],
            path: "BTImagePickerWrapper",
            linkerSettings: [
                // iOS 系统框架
                
                // 系统库
            ]
        ),
        
        // ========== Binary Frameworks ==========
        
        // ========== Bundle Resources ==========
        .target(
            name: "BTImagePickerCommonResources",
            dependencies: [],
            path: "BTImagePickerCommonResources",
            exclude: ["Resources"],
            sources: ["Placeholder.swift"],
            resources: [.copy("Resources")],
            publicHeadersPath: nil
        )
    ]
)
