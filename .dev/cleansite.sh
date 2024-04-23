# This is temporary "release script" 
# until we get a cleaner solution
# for cleaning out the _site folder 
# before sending to a customer

# Usage: sh ./cleanscript.sh

# Before running, you have to update 
# the CUSTOMER variable to include all unwanted customers

# Suggestion:
# Update and keep the commented copy the CUSTOMER list 
# to include all customers

# Copy the line to one that excludes the customer you want to keep.

#CUSTOMER={3shape,napatech,pensam,oticon,fittingsolutions,biolin,schlumberger,universal,bkultrasound,kamstrup,universalrobots}
CUSTOMER={3shape,napatech,pensam,oticon,fittingsolutions,biolin,schlumberger,universal,bkultrasound,universalrobots}

# We need a space separated version of the list for use in for loops.
CUST_LST=$(eval echo $CUSTOMER)

###########################################
# First clean up scripts etc. that 
# shouldn't even be in the _site folder
###########################################
rm _site/iserve 
rm _site/serve 
rm _site/wserve
rm _site/pserve
rm _site/jirajson.groovy
rm _site/cleansite.sh
rm -rf _site/customer_details/


###########################################
# Now clean up customer specific files & folders
# using lots of bash expansion fun
###########################################


echo "Cleaning the following customers:"
for i in $CUST_LST; do
    echo $i
done
#eval echo $CUSTOMER
echo
eval rm  _site/res/code.assessment.$CUSTOMER*
eval rm  _site/images/$CUSTOMER*
eval rm -rf _site/images/report/$CUSTOMER/

echo "#############################"
echo "Searching for remaining files"
#echo $CUST_LST
for i in $CUST_LST; do
    echo $i
	find _site -iname *$i* 
done


