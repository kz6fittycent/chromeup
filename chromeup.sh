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

GET=`sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml`
CURRENT="$(google-chrome-stable --version | cut -d ' ' -f3)"
NEW="$(ls ~/google-chrome-stable-*.eopkg | cut -d "-" -f4)"

#######################################

clear
echo ""
echo "Grabbing new version of Chrome..."
echo ""
$GET
sleep 3

echo "Comparing versions..."
echo ""
echo "Current version is ${CURRENT}"
echo ""
echo "Downloaded version is ${NEW}"

if [ ${NEW} != ${CURRENT} ]
then
    echo "Version $NEW is available for installation!"
    sleep 3
    echo ""
    echo "Installing version $NEW..."
    echo ""
    sleep 3
    sudo eopkg it google-chrome-*.eopkg;sudo rm google-chrome-*.eopkg
    echo ""
else
    echo ""
    echo "Version $CURRENT is up to date..."
    echo ""
    sleep 3
    sudo rm google-chrome-*.eopkg
fi
echo ""
echo "All done!"
sleep 4
clear
