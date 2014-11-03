#Shell script to set source and call the Python Wrapper
#!/bin/sh
#chmod u+x github_updater.sh

#Add changes
dt=`date +"Saved::%m-%d-%Y--%T"`
echo $dt

git add -A
git commit -a -m "$dt"
git push


exit;
