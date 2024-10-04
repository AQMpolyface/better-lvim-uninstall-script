# better-lvim-uninstall-script
i decided to make this script, because the normal uninstall script doesn't delete everything

This script doesnt delete dependencies, sorry.

i took the template of the normal lunarvim uninstall script, but added the directory it doesn't delete.


warning: as of friday october 4, this script works. Now if lunarvim decide to update and add/remove some directory they use, i will try to update the script. Feel free to tell me if the script is outdated.

THIS ONLY WORKS ON LINUX; maybe works on other unix based system? please read the script before running it, i wont be responsible
for any unwanted data loss.

basics: 

everything is no by default. you need to explicitely put y when prompted for this script to work.

if you run the script ithout any argument, it will print every directory this script will target, then ask you if you want to continue. 
The script will ask you if you want to run those commands after finishing:

sudo find / -name "*lvim*" 2>/dev/null && sudo find / -name "*lunarvim*" 2>/dev/null


if you want to directly delete everything directly (not recomended), you can use ./uninstall.sh --clean.

require: `bash` to execute the script


```sh
curl https://raw.githubusercontent.com/AQMpolyface/better-lvim-uninstall-script/refs/heads/main/uninstall.sh > uninstall.sh
chmod +x uninstall.sh
./uninstall.sh
```
