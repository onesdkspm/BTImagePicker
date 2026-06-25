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
                .byName(name: "BaitianImagePicker"),
                .product(name: "UnityBridge", package: "UnityBridge"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/BTImagePicker/1.2.1-dev-1471971/BaitianImagePicker.xcframework.zip",
            checksum: "a95fe2d6d3128f91583201e5f211c89ce4fe7f600f5a5df56b8704321ac99761"
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
