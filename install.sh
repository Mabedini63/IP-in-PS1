#!/bin/bash
# install.sh - Install set-ps1 into shell rc

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME/.set-ps1.sh"
RC_FILE="$HOME/.bashrc"

if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ] || [ "$SHELL" = "/usr/bin/zsh" ]; then
    RC_FILE="$HOME/.zshrc"
fi

cp "$SCRIPT_DIR/set-ps1.sh" "$TARGET"
chmod +x "$TARGET"

MARKER="# >>> set-ps1 >>>"
if ! grep -q "$MARKER" "$RC_FILE" 2>/dev/null; then
    {
        echo ""
        echo "$MARKER"
        echo "[ -f \"$TARGET\" ] && source \"$TARGET\""
        echo "# <<< set-ps1 <<<"
    } >> "$RC_FILE"
    echo "✅ Installed into $RC_FILE"
else
    echo "ℹ️  Already installed in $RC_FILE"
fi

echo "👉 Run: source $RC_FILE"
