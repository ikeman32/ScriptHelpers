# psginit
Introducing psginit or PySimpleGUI Initialize, as the name suggests this bash script will generate the basic boilerplate for a PySimpleGUI project.

## How to use
At the simplest level you can copy this script into a folder then type the following:

```shell
bash psginit
```

But that is tedious and not very handy. You can copy the into /usr/bin folder after making the script executable:

```shell
chmod +x psginit
sudo cp psginit /usr/bin
```

This will have the benefit of it being available to any user on that machine. However, you can make it so that it's only available to you. Open a terminal in the home directory. And type the following:

```shell
touch .bash_functions
{
    echo
    echo "# Bash functions"
    echo
    echo "if [ -f ~/.bash_functions ]; then"
    echo "    . ~/.bash_functions"
    echo "fi"
} >>~/.bashrc
```
This will create a hidden file called .bash_functions and insert the necessary code into your home directory's hidden .bashrc file. Eventually I will create an install script to automate this.

Now you will need to open psginit for editing as well as .bash_functions. Then copy just the psginit function into the .bash_functions file. You will not need the call to the function from the original script as you will be calling the function directly from the commandline. Save .bash_functions and close everything out.

Open a terminal in your projects folder and type:

```shell
psginit
```
Then follow the prompts.

## Features

- Prompts user for basic information that will be used to generate boilerplate
- Creates project, src, and documents folder
- Allows user to choose a license and generates the LICENSE file in project folder
- Generates README, CHANGES in project folder
- Generates two python files in src folder
    - project_name.py with PySimpleGUI boilerplate
    - settings.py

By default settings.py is imported into the main project file. This is an entirely optional file and is safe to delete along with the import. This file is included because of my own personal coding style. I hate cluttering up my main project file with parameter settings for individual components or elements as it is called in PySimpleGUI. 

For me at least it makes it harder to find and change parameter settings. This gives me a single place to find the parameters for a given element and modify them as needed and not clutter up the main project file. How this works is you create a dictionary for the element and then you pass the dictionary to the element like so:

```python
window = sg.Window('Window Title', layout, **st.dic_name)
```

You can also place layout for menus, columns, etc. and you add those to the main layout:

```python
layout = [
    [sg.Menu(st.menuLayout)]
]
```

## Supported Licenses

The following Licenses are currently supported:
- MIT License
- Apache-2.0 License
- GPL-2.0 License
- GPL-3.0-only License
- MPL-2.0 License
- BSD-2-Clause License
- BSD-3-Clause License

It's a fairly simple process to add more licenses.

## TODO

- Create install script
- Make the running script more visually appealing

## Windows Compatable Script

I have been using Linux exclusively since 2017 so I no longer actively develop for Windows. I have ask Chat GPT to generate a compatable script and I have that script in the bat section of this repository. It is; however, untested. If someone wants to take on that project be my guest.

## Mac & Other Shells

In theory this script should work on all platforms with bash, other shells I have no idea. I use Linux Mint with bash and should work with other Distros based on Ubuntu or Debian. But feel free to test this script out and make a pull request if you make improvements or a version that will work in another shell or platform.

## Contributing

I you would like to contribute to this script are any other script I have in this repository. Clone the repository and submit a pull request with your changes.

## Author
David Isakson

<a href="https://www.buymeacoffee.com/dnnews" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/arial-yellow.png" alt="Buy Me A Coffee" width="117px" ></a>