#!/usr/bin/env bash
set -eo pipefail

function usage() {
  echo "Usage: uninstall.sh [<options>]"
  echo ""
  echo "Options:"
  echo "    -h, --help                       Print this help message"
  echo "    --clean                          Will remove every cache object and everything (will not remove installed dependency)"
  echo "    --cleanP                         Will print all file that will be deleted (without deletiung them, you will be prompted to delete them)"
}

function parse_arguments() {
  if [ "$#" -eq 0 ]; then
    echo "printing the file the custom script would delete."
    cleanPrint
  fi

  while [ "$#" -gt 0 ]; do
    case "$1" in
      -h | --help)
        usage
        exit 0
        ;;
      --clean)
        clean
        ;;
      --cleanP)
        cleanPrint
        ;;
    esac
    shift
  done
}



function clean() {

#file that would get deleted normally using the two option in the normal script

rm -rf $HOME/.local/bin/lvim
rm -rf $HOME/.local/share/lunarvim/
rm -rf $HOME/.local/share/lunarvim.bak/
rm -rf $HOME/.local/share/lunarvim.old/
rm -rf $HOME/.cache/lvim
rm -rf $HOME/.cache/lvim.bak
rm -rf $HOME/.cache/lvim.old
rm -rf $HOME/.config/lvim
rm -rf $HOME/.config/lvim.bak
rm -rf $HOME/.config/lvim.old

#custom delete
rm -rf $HOME/.local/share/lvim/
rm -rf $HOME/.local/state/lvim/

rm -rf $HOME/.local/share/icons/hicolor/16x16/apps/lvim.svg
rm -rf $HOME/.local/share/icons/hicolor/22x22/apps/lvim.svg
rm -rf $HOME/.local/share/icons/hicolor/24x24/apps/lvim.svg
rm -rf $HOME/.local/share/icons/hicolor/32x32/apps/lvim.svg
rm -rf $HOME/.local/share/icons/hicolor/48x48/apps/lvim.svg
rm -rf $HOME/.local/share/icons/hicolor/64x64/apps/lvim.svg
rm -rf $HOME/.local/share/applications/lvim.desktop
echo "done! do you want to run a command to find out if everything is correctly deleted?"
echo 'the command is find / -name "*lvim*" and find / -name "*lunarvim*"'
echo "those commands may take a while. y/N"

read userInput

if [ "$userInput" == "y" ]; then
  echo "starting command...(may take a while)"
     find / -name "*lvim*" 2>/dev/null
     find / -name "*lunarvim*" 2>/dev/null
    echo "all done! if there are more files, you can delete them manually"
    echo "ATTENTION: DO NOT MODIFY IF THERE ARE FILE IN /run/* , could break somthing"
    return 0
  else
    echo "you can manualy run the command above, or just enjoy your day!"
    return 0
    fi
  }
function cleanPrint() {
echo "file the normal script would delete"
echo $HOME/.local/bin/lvim
echo $HOME/.local/share/lunarvim/
echo $HOME/.local/share/lunarvim.bak/
echo $HOME/.local/share/lunarvim.old/
echo $HOME/.cache/lvim
echo $HOME/.cache/lvim.bak
echo $HOME/.cache/lvim.old
echo $HOME/.config/lvim
echo $HOME/.config/lvim.bak
echo $HOME/.config/lvim.olde 

echo "file the normal script wouldnt delete"
echo $HOME/.local/share/lvim/
echo $HOME/.local/state/lvim/
echo $HOME.local/share/icons/hicolor/16x16/apps/lvim.svg
echo $HOME/.local/share/icons/hicolor/22x22/apps/lvim.svg
echo $HOME/.local/share/icons/hicolor/24x24/apps/lvim.svg
echo $HOME/.local/share/icons/hicolor/32x32/apps/lvim.svg
echo $HOME/.local/share/icons/hicolor/48x48/apps/lvim.svg
echo $HOME/.local/share/icons/hicolor/64x64/apps/lvim.svg
echo $HOME/.local/share/applications/lvim.desktop


echo "do you want to procede and delete the files listed above? y/N"

read decision

if [ "$decision" == "y" ]; then
  echo "deleting the files..."
  clean
else
  echo "quitting"
  echo "run ./uninstall.sh --clean to directly delete the files"
  return 0
fi

}


function main() {
echo "I am not responsible for any data that could be lost, please read the script before running it to make sure it will not delete anythin important"
  parse_arguments "$@"
}

main "$@"
