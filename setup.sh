#!/bin/bash

# Exit immediately on error
set -e

mkdir -p libs
cd libs

echo -e "\e[32mDownloading fnalibs...\e[m"
curl -O https://fna.flibitijibibo.com/archive/fnalibs.tar.bz2

echo -e "\e[32mExtracting fnalibs...\e[m"
tar -xf fnalibs.tar.bz2

cd ..

git submodule update --init --remote --recursive

echo -e "What is your project name?"
read name

# BSD sed (macOS) requres a backup extension for sed when using -i
# gnu sed (linux) requires no space between -i and the extension
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Core/FNAECSTemplate.Core.csproj
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.sln
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" .vscode/launch.json
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" .vscode/tasks.json
sed -i'.temp-bak' -e "s/Game1/${name}/g" FNAECSTemplate/Game1.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Core/Game1.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Core/Systems/ExampleSystem.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Core/Components/Components.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Core/Messages/Messages.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Core/Relations/Relations.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Core/Renderers/ExampleRenderer.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Core/Utility/InputHelper.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Core/Systems/Input.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Core/Utility/Rando.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Core/Content.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Console/Program.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Console/FNAECSTemplate.Console.csproj
# web
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Web/FNAECSTemplate.Web.csproj
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Web/Program.cs
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" FNAECSTemplate.Assets/FNAECSTemplate.Assets.csproj
# patch console
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" build_debug.sh
sed -i'.temp-bak' -e "s/FNAECSTemplate/${name}/g" build_release.sh

find . -name "*.temp-bak" -type f -delete

mv "FNAECSTemplate.sln" "${name}.sln"
mv "FNAECSTemplate.Core/FNAECSTemplate.Core.csproj" "FNAECSTemplate.Core/${name}.Core.csproj"
mv "FNAECSTemplate.Core/Game1.cs" "FNAECSTemplate.Core/${name}.cs"
mv "FNAECSTemplate.Core" "${name}.Core"
# rename Web
mv "FNAECSTemplate.Web/FNAECSTemplate.Web.csproj" "FNAECSTemplate.Web/${name}.Web.csproj"
mv "FNAECSTemplate.Web" "${name}.Web"
# rename assets
mv "FNAECSTemplate.Assets/FNAECSTemplate.Assets.csproj" "FNAECSTemplate.Assets/${name}.Assets.csproj"
mv "FNAECSTemplate.Assets" "${name}.Assets"
# rename console
mv "FNAECSTemplate.Console/FNAECSTemplate.Console.csproj" "FNAECSTemplate.Console/${name}.Console.csproj"
mv "FNAECSTemplate.Console" "${name}.Console"
# rename web

echo -e "\e[32mDone!\e[m"
