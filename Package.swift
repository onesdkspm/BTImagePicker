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
        .package(url: "https://github.com/onesdkspm/BTSDKUIKitCore.git", from: "2.0.3"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "BTImagePickerWrapper",
            dependencies: [
                .byName(name: "BaitianImagePicker"),
                .product(name: "BTSDKUIKitCore", package: "BTSDKUIKitCore"),
            ],
            path: "BTImagePickerWrapper",
            linkerSettings: [
                // iOS 系统框架
                
                // 系统库
            ]
        ),
        
        // ========== Binary Frameworks ==========
        .binaryTarget(
            name: "BaitianImagePicker",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/BTImagePicker/2.0.3/BaitianImagePicker.xcframework.zip",
            checksum: "322409f7b1ca95dfd32b485e56b7c03033b9d3c76618d875dd3709e666a3f461"
        ),
        
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
