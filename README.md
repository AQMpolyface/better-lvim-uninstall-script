# better-lvim-uninstall-script
i decided to make this script, because the normal uninstall script doesnt delete everything

i took the template of the normal lunarvim uninstall script, but it does not delete everything, at least on linux.


THIS ONLY WORKS ON LINUX; maybe works on other unix based system? please read the script before running it, i wont be responsible
for any unwanted data loss.

basics: 
if you run the script ithout any argument, it will print every directory this script will target, then ask you if you want to continue. 
The script will ask you if you want to run those commands after finishing:

sudo find / -name "*lvim*" 2>/dev/null && sudo find / -name "*lunarvim*" 2>/dev/null


if you want to directly delete everything directly (not recomended), you can use ./uninstall.sh --clean.

require: `bash` to execute the script



if you wanna do it manually:

```sh
curl https://raw.githubusercontent.com/AQMpolyface/better-lvim-uninstall-script/refs/heads/main/uninstall.sh > uninstall.sh
chmod +x uninstall.sh
./uninstall.sh
```
one liner: 
```sh
curl https://raw.githubusercontent.com/AQMpolyface/better-lvim-uninstall-script/refs/heads/main/uninstall.sh | sh
```
