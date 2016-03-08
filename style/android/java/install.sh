#!/usr/bin/env bash
# Installs thoughtbot's IntelliJ configs into your user configs.

echo "Installing thoughtbot IntelliJ configs..."

CONFIGS=$(dirname "${BASH_SOURCE[0]}")/configs

for directory in "$HOME"/Library/Preferences/IntelliJIdea*  \
         "$HOME"/Library/Preferences/IdeaIC*        \
         "$HOME"/Library/Preferences/AndroidStudio* \
         "$HOME"/.IntelliJIdea*/config              \
         "$HOME"/.IdeaIC*/config                    \
         "$HOME"/.AndroidStudio*/config
do
  if [[ -d "$directory" ]]; then

    # Install codestyles
    mkdir -p "$directory/codestyles"
    cp -frv "$CONFIGS/codestyles"/* "$directory/codestyles"

  fi
done

echo "Done."
echo 
echo "Restart IntelliJ or AndroidStudio, go to preferences, and apply 'thoughtbotAndroid'."
