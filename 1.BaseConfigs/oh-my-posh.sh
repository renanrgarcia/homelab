#!/bin/bash

if ! command -v oh-my-posh &>/dev/null; then
    echo "🎨 === Installing Oh My Posh ==="
    curl -s https://ohmyposh.dev/install.sh | bash -s

    # Add the installation path to PATH
    export PATH="$PATH:$HOME/.local/bin"

    # Add PATH update to bashrc if not already there
    PATH_LINE='export PATH="$PATH:$HOME/.local/bin"'
    if ! grep -Fq "$PATH_LINE" "$HOME/.bashrc"; then
        echo "$PATH_LINE" >>"$HOME/.bashrc"
    fi
else
    echo "🎨 Oh My Posh is already installed"
fi

# Use full path to oh-my-posh or ensure PATH is updated
echo "🔤 === Installing Oh My Posh fonts ==="
$HOME/.local/bin/oh-my-posh font install meslo

echo "⚙️ === Configuring Oh My Posh for current user ==="
PROFILE_LINE='eval "$($HOME/.local/bin/oh-my-posh init bash --config '\''https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json'\'')"'
if ! grep -Fq "$PROFILE_LINE" "$HOME/.bashrc"; then
    echo "$PROFILE_LINE" >>"$HOME/.bashrc"
fi

echo "✅ === Setup complete! ==="
echo "🔄 Please restart your terminal or run 'source ~/.bashrc' to apply Oh My Posh theme"
source ~/.bashrc
