// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "BTImagePicker",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "BTImagePicker",
            targets: ["BTImagePickerWrapper", "CommonResources"]
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/BTImagePicker/2.0.0/BaitianImagePicker.xcframework.zip",
            checksum: "0a86f99c985b2caf634e427a17a62da24419eb67f60655fe71dda66b0e5baf8c"
        ),
        
        // ========== Bundle Resources ==========
        .target(
            name: "CommonResources",
            dependencies: [],
            path: "CommonResources",
            exclude: ["Resources"],
            sources: ["Placeholder.swift"],
            resources: [.copy("Resources")],
            publicHeadersPath: nil
        )
    ]
)
