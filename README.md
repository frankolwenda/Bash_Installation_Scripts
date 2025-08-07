# Bash_Installation_Scripts
A simple Repo for Installing programs via bash on most linux distros. 
This is mostly a personal repo for the sake of my own learning/prodcutivity. But feel free to borrow or use these scripts as you please. 

# Prerequisites for installation
In order to run a bash script, there are a few pre-requisites that you need 

1. Check if bash is pre-installed
```
bash --version
```

2. Install Bash if Missing
```Debian
sudo apt update && sudo apt install bash
```
```RHEL/CENT OS/Fedora
sudo yum install bash
```
```MacOS
brew install bash
```
```Windows
Use WSL and your favourite linux distro as above
```

3. Permissions - Consent matters!
Before running a bash script you need to make it executable. To do so ensure that. Take the necessary step below to ensure that is the case. 'script.sh' is the name you have chosen for your file
```
chmod +x script.sh
```

4. Running the script.
Now that it is executable. There are various methods to get the script running
```Bash (use this if not in $PATH)
./script.sh
```
```Bash (My favourite method - it's the easiest way)
bash script.sh
```
```Bash (Only works if directory is listed in $PATH
script.sh
```
