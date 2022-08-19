// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "UnrarKit",
    defaultLocalization: "en",
    products: [
        .library(
            name: "UnrarKit",
            targets: ["UnrarKit"]),
    ],
    targets: [
        .target(
            name: "UnrarKit",
            dependencies: ["unrar-lib"],
            path: "Classes",
            publicHeadersPath: "public-headers",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("../Classes/Categories"),
                .headerSearchPath("../Libraries/unrar")
            ],
            cxxSettings: [
                .headerSearchPath("."),
                .headerSearchPath("../Classes/Categories"),
                .headerSearchPath("../Libraries/unrar")
            ],
            linkerSettings: [
//                .linkedLibrary("c++"),
                .linkedLibrary("z")
            ]),
        .target(
            name: "unrar-lib",
            dependencies: [],
            path: "Libraries/unrar",
            sources: [
                "rar.cpp",
                "strlist.cpp",
                "strfn.cpp",
                "pathfn.cpp",
                "smallfn.cpp",
                "global.cpp",
                "file.cpp",
                "filefn.cpp",
                "filcreat.cpp",
                "archive.cpp",
                "arcread.cpp",
                "unicode.cpp",
                "system.cpp",
                "isnt.cpp",
                "crypt.cpp",
                "crc.cpp",
                "rawread.cpp",
                "encname.cpp",
                "resource.cpp",
                "match.cpp",
                "timefn.cpp",
                "rdwrfn.cpp",
                "consio.cpp",
                "options.cpp",
                "errhnd.cpp",
                "rarvm.cpp",
                "secpassword.cpp",
                "rijndael.cpp",
                "getbits.cpp",
                "sha1.cpp",
                "sha256.cpp",
                "blake2s.cpp",
                "hash.cpp",
                "extinfo.cpp",
                "extract.cpp",
                "volume.cpp",
                "find.cpp",
                "unpack.cpp",
                "headers.cpp",
                "threadpool.cpp",
                "rs16.cpp",
                "cmddata.cpp",
                "ui.cpp",
                "filestr.cpp",
                "recvol.cpp",
                "rs.cpp",
                "scantree.cpp",
                "qopen.cpp",
                "dll.cpp"],
            publicHeadersPath: "public-headers",
            cSettings: [
                .unsafeFlags([
                    "-Wno-return-type",
                    "-Wno-logical-op-parentheses",
                    "-Wno-conversion",
                    "-Wno-parentheses",
                    "-Wno-unused-function",
                    "-Wno-unused-variable",
                    "-Wno-switch",
                    "-Wno-unused-command-line-argument",
                    "-Wno-strict-prototypes",
                    "-Wno-conditional-uninitialized"]),
                .headerSearchPath(".")
            ],
            cxxSettings: [
                .define("SILENT"),
                .define("RARDLL"),
                .headerSearchPath(".")
            ]
        ),
        .testTarget(
            name: "UnrarKitTests",
            dependencies: ["UnrarKit"],
            path: "Tests"),
    ]
)
