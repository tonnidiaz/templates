const { rmSync, cpSync, existsSync, mkdirSync } = require("fs");
const os = require("os");
const path = require("path");
const { cwd } = require("process");
console.log("\nTu build tool")

const main = async () =>{
    // Check os
    const platform = os.platform()
    console.log({platform, cwd: cwd()});

    let platFolder = ""
    const isWin = platform == "win32"
    console.log({isWin});
    switch (platform){
        case "linux":
            platFolder = "linux"
            break;
        case "win32":
            platFolder = "win"
            break;
        case "darwin":
            platFolder = "macos"
            break;
    }

    const assetsBinDir =  path.join(cwd(),"assets", "bin")
    const platAssetsBinDir =  path.join(assetsBinDir, platFolder)
    const binariesDir = path.join(cwd(),`binaries`, platFolder)

    // rmv assets/bin folder
    console.log(`\nRemoving assets/bin folder: ${assetsBinDir}...`);
    if (existsSync(assetsBinDir))
        rmSync(assetsBinDir, {recursive: true})
    // copy binaries to assets/bin folder
    console.log("\nCopying to assets/bin folder...");

    mkdirSync(platAssetsBinDir, {recursive: true})
    
    cpSync(binariesDir, platAssetsBinDir, {recursive: true})
    console.log("Binaries coppied!");


}

main()