#!/bin/bash

if ! command -v oh-my-posh &>/dev/null; then
    echo "🎨 === Installing Oh My Posh ==="
    curl -s https://ohmyposh.dev/install.sh | bash -s
else
    echo "🎨 Oh My Posh is already installed"
fi

echo "🔤 === Installing Oh My Posh fonts ==="
oh-my-posh font install meslo

echo "⚙️ === Configuring Oh My Posh for current user ==="
PROFILE_LINE='eval "$(oh-my-posh init bash --config '\''https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json'\'')"'
if ! grep -Fxq "$PROFILE_LINE" "$HOME/.bashrc"; then
    echo "$PROFILE_LINE" >>"$HOME/.bashrc"
fi

echo "✅ === Setup complete! ==="
echo "🔄 Please restart your terminal or run 'source ~/.bashrc' to apply Oh My Posh theme"
