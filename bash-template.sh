#!/usr/bin/bash
###########################################################################################################
# Script Template
# 
# Write a brief description of the bash script here.
# Change Log :
# 21-04-2023     Nisha Singhal    Original Code. This is a template to create new bash shell scripts.
#
###########################################################################################################
#
#  Copyright (C) 2007, 2019 David Both                                        
#  LinuxGeek46@both.org                                                        
#                                                                              
#  This program is free software; you can redistribute it and/or modify        
#  it under the terms of the GNU General Public License as published by        
#  the Free Software Foundation; either version 2 of the License, or           
#  (at your option) any later version.                                         
#                                                                              
#  This program is distributed in the hope that it will be useful,             
#  but WITHOUT ANY WARRANTY; without even the implied warranty of              
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               
#  GNU General Public License for more details.                                
#                                                                              
#  You should have received a copy of the GNU General Public License           
#  along with this program; if not, write to the Free Software                 
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   
#
###########################################################################################################
# change log
ChangeLog()
{
   echo "Change Log :
21-04-2023     Nisha Singhal    Original Code. This is a template to create new bash shell scripts."
}
#
###########################################################################################################
# license
License()
{
   echo "Copyright (C) 2007, 2019 David Both                                        
LinuxGeek46@both.org                                                        
                                                                              
This program is free software; you can redistribute it and/or modify        
it under the terms of the GNU General Public License as published by        
the Free Software Foundation; either version 2 of the License, or           
(at your option) any later version.                                         
                                                                              
This program is distributed in the hope that it will be useful,             
but WITHOUT ANY WARRANTY; without even the implied warranty of              
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               
GNU General Public License for more details.                                
                                                                              
You should have received a copy of the GNU General Public License           
along with this program; if not, write to the Free Software                 
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA "

}
#
#
###########################################################################################################
#help
Help()
{
    #display help
    echo "add descriptions of the funciton here."
    echo
    echo "Syntax : script tempalte [-c|g|h|v|V]"
    echo
    echo "Options: "
    echo "c   print the change log of the script." #add less option for c as well 
    echo "g   print the GPL license notification."
    echo "h   print this help text."
    echo "v   verbose mode."
    echo "V   print software version and exit."
    echo 
}
#
#
###########################################################################################################
#check for root
CheckRoot()
{
    #if we are not running as root we exit the program
    if [ `id -u` != 0 ]
      then echo "ERROR: You must be root user to run this program"
      exit
   fi
}
#
###########################################################################################################
#
#                                 MAIN PROGRAM
#
###########################################################################################################
#Sanity Checks
# Are we rnning as root?
CheckRoot
###########################################################################################################
#Initialize variables
option=""
Msg="Hello world!"
print_msg=true
###########################################################################################################
#Process the options here
# Get the options
while getopts ":cghvV" option; do
   case $option in
      c) # display change log
         ChangeLog
	 print_msg=false
         ;;
      g) # display GPL license info
         License
	 print_msg=false
         ;;
      h) # display Help
         Help
	 print_msg=false
         ;;
      v) # verbose mode on
         echo "verbose mode on..."
	 print_msg=false
         ;;
      V) #display version of the script
         echo "Version : 1.1"
	 print_msg=false
         ;;
     *) # incorrect option
         echo "Error: Invalid option ${OPTARG}"
	 print_msg=false
         ;;
   esac
done
###########################################################################################################
#Execute main function of the script
if [ $print_msg = true ] ;
then
	echo "$Msg";
fi;
