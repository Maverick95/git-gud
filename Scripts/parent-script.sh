MY_VAR="Test string"
echo "Running child-script in same shell environment..."
. ./child-script.sh
echo "Running child-script in spawned shell environment..."
./child-script.sh
echo "A simple echo test..."
echo "$MY_VAR followed by some stuff."
echo "$MY_VARfollowed by some stuff."