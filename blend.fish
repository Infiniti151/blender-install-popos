#!/usr/bin/fish

echo ➡️ 'Enter an action'⬅️
echo -e '\e[36m1. ⬇️ Install'⬇️
echo -e '2. ⬆️ Update'⬆️
echo -e '3. ❌Uninstall'❌
echo -e '4. 🔴Quit\e[0m'🔴
read sel
switch $sel
    case '1'
        fish ./scripts/install.fish
    case '2'
        fish ./scripts/update.fish
    case '3'
        fish ./scripts/uninstall.fish
    case '*'
end

