
 השיחה נפתחה. 3 הודעות. הודעה אחת שלא נקראה.

דילוג לתוכן
שימוש ב-Gmail עם קוראי מסך
Meet
פגישה חדשה
הצטרפות לפגישה
Hangouts

1 מתוך 239
script‏‏
דואר נכנס

eldan
19:22 ‎(לפני 14 דקות)‎
-v - verbose - echo each file decompressed & warn for each file that was NOT decompressed -r - recursive - will traverse contents of folders recursively, perfor

פוסטצי אלדן
19:29 ‎(לפני 7 דקות)‎
#!/usr/bin/ksh echo -e "\n\n" function validateParam { # Get the options while getopts :hvr option; do case $option in h) # display Help Usage ;; v) # display v

פוסטצי אלדן
קבצים מצורפים
19:36 ‎(לפני 0 דקות)‎
אני

   
תרגום הודעה
השבתה עבור: אנגלית
 

 

 

 

 

 

תודה.

חתימה

 

From: eldan [mailto:eldan.postagi@gmail.com]
Sent: Saturday, December 18, 2021 7:23 PM
To: פוסטצי אלדן <eldan.Postachi@dbank.co.il>
Subject: script

 

-v - verbose - echo each file decompressed & warn for each file that was NOT


אזור קבצים מצורפים
#!/usr/bin/ksh

echo -e "\n\n"


function validateParam
{
# Get the options
while getopts :hvr option; do
   case $option in
      h) # display Help
         Usage
         ;;
      v) # display verbose
         export verbose=1
         ;;
      r) # display re
         export recursive=1
         ;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done
}

function Usage 
{
echo -e "
	-v - verbose - echo each file decompressed & warn for each file that was NOT decompressed
	-r - recursive - will traverse contents of folders recursively, performing unpack on each.
	-h - Should receive a HELP notice
"
exit
}

function CheckingFileType
{

for i in $ReceivedVar
do
	export FileType="${i##*.}"
	echo FileType=$FileType i=$i
	case $FileType in
		ggunzip) 
			echo gunzip
			export DirName=`basename $i .gunzip`
			mkdir $DirName
			
			;;
		zip)
			echo unzip1
			export DirName=`basename $i .zip`
			unzip -o $i -d $DirName
			cd $DirName
			pwd
			export X=`ls`
			echo X=$X
			CheckInsideDirectory $X
			pwd
			CheckDirectory
			echo 2
			;;
		rar)
			echo RAR1
			;;
		*)
			echo other
			;;
	esac	
	
done
}


function CheckDirectory
{

for y in $X
do
	if [ -d "$y"]
	then
		echo dir
		echo $y
		CheckingFileType
		
	else 
		echo file
		
	fi
done
}

function CheckInsideDirectory
{
if [ $recorcivy -eq "1" ]
then
	ROOT=$1
	echo ROOT=$ROOT
	#echo ROOT_PATH=$ROOT_PATH
	for i in `ls  ${ROOT}`
	do
		if [ -d "$ROOT$i" ]
		then
			echo directory $i
			cd $ROOT$i
			ROOT_PATH=`pwd`
			CheckInsideDirectory $ROOT_PATH
		else
			echo fileee $i
			CheckingFileType
		fi
	done
fi

}

##############
##      MAIN    ##
##############


export ReceivedVar="$@"

validateParam



CheckingFileType

#ROOT=/home/da1ebapp1/eldan/tmp/
#CheckInsideDirectory $ROOT




echo -e "\n\n\n\n"
eldan.txt
מציג את eldan.txt.