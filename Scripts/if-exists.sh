SHELL_NAME_1="first-script"
SHELL_NAME_2="parent-script"
echo "Inputs: ${SHELL_NAME_1} and ${SHELL_NAME_2}"
if [ -e "./${SHELL_NAME_1}.sh" -a -e "./${SHELL_NAME_2}.sh" ]
then
    echo "Both scripts are located!"
fi
