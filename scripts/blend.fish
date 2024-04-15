#!/usr/bin/fish

echo 'Enter an action:'
echo -e '\e[36m1. Install'
echo -e '\e[36m2. Update'
echo -e '\e[36m3. Quit\e[0m'
read sel
switch $sel
    case '1'
        fish ./scripts/install.fish
    case '2'
        fish ./scripts/update.fish
    case '*'
end

