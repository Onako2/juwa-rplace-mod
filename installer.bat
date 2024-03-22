echo sus

IF NOT EXIST %AppData%\.minecraft\mods (
    curl -L -o "installer.exe" "https://maven.fabricmc.net/net/fabricmc/fabric-installer/1.0.0/fabric-installer-1.0.0.exe" 
    installer.exe client
    mkdir "%AppData%\.minecraft\mods"
curl -L -o "%AppData%\.minecraft\mods\juwa-rplace-mod.jar" "https://cdn.modrinth.com/data/cGr3UMcJ/versions/SBErhfQI/juwa-place-0.2.0.jar"
curl -L -o "%AppData%\.minecraft\mods\malilib.jar" "https://cdn.modrinth.com/data/GcWjdA9I/versions/kZJWQDi6/malilib-fabric-1.20.4-0.18.1.jar"
IF NOT EXIST %AppData%\.minecraft\config\fabric curl -L -o "%AppData%\.minecraft\mods\fabricapi.jar" "https://github.com/FabricMC/fabric/releases/download/0.96.11+1.20.4/fabric-api-0.96.11+1.20.4.jar"
IF NOT EXIST %AppData%\.minecraft\config\litematica curl -L -o "%AppData%\.minecraft\mods\litematica.jar" "https://mediafilez.forgecdn.net/files/5170/70/litematica-fabric-1.20.4-0.17.2.jar"
IF NOT EXIST %AppData%\.minecraft\config\sodium-options.json curl -L -o "%AppData%\.minecraft\mods\sodium.jar" "https://github.com/CaffeineMC/sodium-fabric/releases/download/mc1.20.3-0.5.5/sodium-fabric-mc1.20.3-0.5.5.jar"

) else (
    echo Fabric is already installed!
    echo Checking for Labymod!
    IF EXIST %AppData%\.minecraft\labymod-neo\fabric\1.20.4\mods (
        curl -L -o "%AppData%\.minecraft\labymod-neo\fabric\1.20.4\mods\juwa-rplace-mod.jar" "https://cdn.modrinth.com/data/cGr3UMcJ/versions/SBErhfQI/juwa-place-0.2.0.jar"
        pushd "%AppData%\.minecraft\labymod-neo\fabric\1.20.4\mods\"
        goto downloadLaby
    )

    IF EXIST %AppData%\.minecraft\labymod-neo\fabric\1.20.3\mods (
        curl -L -o "%AppData%\.minecraft\labymod-neo\fabric\1.20.3\mods\juwa-rplace-mod.jar" "https://cdn.modrinth.com/data/cGr3UMcJ/versions/SBErhfQI/juwa-place-0.2.0.jar"
        pushd "%AppData%\.minecraft\labymod-neo\fabric\1.20.3\mods\"
        goto downloadLaby
    )

    IF EXIST %AppData%\.minecraft\labymod-neo\fabric\1.20.2\mods (
        curl -L -o "%AppData%\.minecraft\labymod-neo\fabric\1.20.2\mods\juwa-rplace-mod.jar" "https://cdn.modrinth.com/data/cGr3UMcJ/versions/SBErhfQI/juwa-place-0.2.0.jar"
        pushd "%AppData%\.minecraft\labymod-neo\fabric\1.20.2\mods\"
        goto downloadLaby
    )
    
    IF EXIST %AppData%\.minecraft\labymod-neo\fabric\1.20.1\mods (
        curl -L -o "%AppData%\.minecraft\labymod-neo\fabric\1.20.1\mods\juwa-rplace-mod.jar" "https://cdn.modrinth.com/data/cGr3UMcJ/versions/SBErhfQI/juwa-place-0.2.0.jar"
        pushd "%AppData%\.minecraft\labymod-neo\fabric\1.20.1\mods\"
        goto downloadLaby
    )
    
    IF EXIST %AppData%\.minecraft\labymod-neo\fabric\1.20\mods (
        curl -L -o "%AppData%\.minecraft\labymod-neo\fabric\1.20\mods\juwa-rplace-mod.jar" "https://cdn.modrinth.com/data/cGr3UMcJ/versions/SBErhfQI/juwa-place-0.2.0.jar"
        pushd "%AppData%\.minecraft\labymod-neo\fabric\1.20\mods\"
        goto downloadLaby
    )

    curl -L -o "%AppData%\.minecraft\mods\juwa-rplace-mod.jar" "https://cdn.modrinth.com/data/cGr3UMcJ/versions/SBErhfQI/juwa-place-0.2.0.jar"
curl -L -o "%AppData%\.minecraft\mods\malilib.jar" "https://cdn.modrinth.com/data/GcWjdA9I/versions/kZJWQDi6/malilib-fabric-1.20.4-0.18.1.jar"
IF NOT EXIST %AppData%\.minecraft\config\fabric curl -L -o "%AppData%\.minecraft\mods\fabricapi.jar" "https://github.com/FabricMC/fabric/releases/download/0.96.11+1.20.4/fabric-api-0.96.11+1.20.4.jar"
IF NOT EXIST %AppData%\.minecraft\config\litematica curl -L -o "%AppData%\.minecraft\mods\litematica.jar" "https://mediafilez.forgecdn.net/files/5170/70/litematica-fabric-1.20.4-0.17.2.jar"
IF NOT EXIST %AppData%\.minecraft\config\sodium-options.json curl -L -o "%AppData%\.minecraft\mods\sodium.jar" "https://github.com/CaffeineMC/sodium-fabric/releases/download/mc1.20.3-0.5.5/sodium-fabric-mc1.20.3-0.5.5.jar"

)

goto end
:downloadLaby

pushd "%AppData%\.minecraft\labymod-neo\fabric\1.20\mods\"
pushd "%AppData%\.minecraft\labymod-neo\fabric\1.20.1\mods\"
pushd "%AppData%\.minecraft\labymod-neo\fabric\1.20.2\mods\"
pushd "%AppData%\.minecraft\labymod-neo\fabric\1.20.3\mods\"
pushd "%AppData%\.minecraft\labymod-neo\fabric\1.20.4\mods\"
curl -L -o "juwa-rplace-mod.jar" "https://cdn.modrinth.com/data/cGr3UMcJ/versions/SBErhfQI/juwa-place-0.2.0.jar"
curl -L -o "malilib.jar" "https://cdn.modrinth.com/data/GcWjdA9I/versions/kZJWQDi6/malilib-fabric-1.20.4-0.18.1.jar"
curl -L -o "fabricapi.jar" "https://github.com/FabricMC/fabric/releases/download/0.96.11+1.20.4/fabric-api-0.96.11+1.20.4.jar"
curl -L -o "litematica.jar" "https://mediafilez.forgecdn.net/files/5170/70/litematica-fabric-1.20.4-0.17.2.jar"


:end
pause