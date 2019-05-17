#!/bin/bash
### Created by stevenowens@ ###
 
prodcertstatus || prodaccess
echo What is the name of your CitC client?
read clientname
cd $(p4 g4d "$clientname")
cd corp/support/tools/beamfarm/frontend/themes/
echo What do you want to call the new theme?
read newthemename
echo "
Now choose your colors for $newthemename
 
Color Choices:
red, pink, purple, indigo, blue, cyan, teal, green,
lime, yellow, amber, orange, grey
 
 
"
echo Input desired primary color:
read primarycolor
echo
echo Input desired accent color:
read accentcolor
echo
echo Input desired warning color:
read warningcolor
echo "
 
You chose--
Theme name:  $newthemename
Primary color:  $primarycolor
Accent color:  $accentcolor
Warning color:  $warningcolor
 
"
read -r -p "Are you ready to continue? [y/n] " response
echo
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
g4 cp normal.scss $newthemename.scss > /dev/null 2>&1
sed -i -e 16i'"'$newthemename.scss'",' BUILD
sed -i -e "s/normal-theme/$newthemename-theme/g" $newthemename.scss
sed -i '3d' $newthemename.scss
sed -i "3i "'$'"$newthemename-theme-primary: mat-palette("'$gmat-'"$primarycolor, 600);" $newthemename.scss
sed -i '4d' $newthemename.scss
sed -i "4i "'$'"$newthemename-theme-accent: mat-palette("'$gmat-'"$accentcolor, 600);" $newthemename.scss
sed -i '5d' $newthemename.scss
sed -i "5i "'$'"$newthemename-theme-warn: mat-palette("'$gmat-'"$warningcolor, 600);" $newthemename.scss
sed -i -e "4i@import './themes/"$newthemename"';" ../style.scss
sed -i -e "15i  { name:  '$newthemename', value: '$newthemename-theme', }," themes.ts
cd ..
iblaze run :devserver
echo "
 
 
If you are satisifed with it, follow the instructions on go/td-themes
to submit the CL"
 
else
echo Goodbye!
exit
fi
