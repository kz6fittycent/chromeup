clear

echo ""
echo "------------------------------"
echo ""
echo "      UPDATING CHROME"
echo ""
echo "------------------------------"
sleep 3

# VARIABLES
#######################################

GRAB=`sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/web/browser/google-chrome-s>
NEW=`curl https://raw.githubusercontent.com/getsolus/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml 2>1 /dev/n>
CURRENT="$(google-chrome-stable --version | cut -d ' ' -f3)"

#######################################

clear
echo ""
echo "Checking for latest version of Chrome..."
echo ""
$NEW
sleep 3

echo "Comparing versions..."
echo ""
echo "Current version is ${CURRENT}"
echo ""
echo "Latest version is ${NEW}"

if [ ${NEW} != ${CURRENT} ]
then
    echo "Version $NEW is available for installation!"
    sleep 3
    echo ""
    echo "Downloading and compiling version $NEW..."
    echo ""
    $GRAB
    sleep 3
    sudo eopkg it google-chrome-*.eopkg;sudo rm google-chrome-*.eopkg
    echo ""
    rm $HOME/1
else
    echo ""
    echo "Version $CURRENT is up to date..."
    echo ""
    sleep 3
    sudo rm $HOME/google-chrome-*.eopkg
    rm $HOME/1
fi
echo ""
echo "All done!"
sleep 4
clear
