#!/bin/bash

# Function to display aliases by category
display_aliases_by_category() {
    clear
    category="$1"
    case "$category" in
        "1")
            echo "Aliases for editing configuration files:"
            echo "1. edalias - Edit .bash_aliases"
            echo "2. edbashrc - Edit .bashrc"
            echo "3. edfuncs - Edit .bash_functions"
            ;;
        "2")
            echo "Aliases for commandline shortcuts:"
            echo "4. refresh - Restart the shell"
            echo "5. home - Change to home directory"
            echo "6. cls - Clear the screen"
            # Add more aliases in this category as needed
            ;;
        "3")
            echo "Aliases for application management:"
            echo "7. install - Install a package using Nala package manager"
            echo "8. upgradable - List upgradable packages with Nala"
            echo "9. purge - Purge a package with Nala"
            echo "B. Back to the previous menu"
            ;;
        *)
            echo "Invalid category."
            ;;
    esac
}

# Function to display all aliases
display_all_aliases() {
    clear
    echo "Browse all aliases:"
    for ((i = 0; i < ${#aliases[@]}; i++)); do
        alias_line="${aliases[i]}"
        alias_name="$(echo "$alias_line" | cut -d'=' -f1 | cut -d' ' -f2)"
        echo "[$((i + 1))] Alias $alias_name"
    done

    while true; do
        read -rp "Enter the number of an alias to see an explanation, or 'B' to go back to the main menu: " alias_choice

        case "$alias_choice" in
            [1-9]|[1-9][0-9])
                alias_index=$((alias_choice - 1))
                alias_explanations "$alias_index"
                read -rp "Press Enter to continue..."
                break
                ;;
            [Bb])
                return
                ;;
            *)
                echo "Invalid input. Please select a valid number or 'B' to go back to the main menu."
                ;;
        esac
    done
}

# Function to provide explanations for aliases
alias_explanations() {
    alias_choice="$1"
    alias_line="${aliases[$alias_choice - 1]}"
    alias_name="$(echo "$alias_line" | cut -d "'" -f2)"
    alias_command="$(echo "$alias_line" | cut -d '=' -f2-)"
    
    echo "Alias $alias_name: $alias_command"
    
    while true; do
        read -rp "Do you want to add this alias to the queue (A), install it immediately (I), or go back (B)? " action

        case "$action" in
            A|a)
                # Add the selected alias to the queue
                queue+=("$alias_line")
                echo "Added alias to the queue."
                break
                ;;
            I|i)
                # Install the alias immediately
                install_alias "$alias_line"
                break
                ;;
            B|b)
                # Go back to the previous menu
                return
                ;;
            *)
                echo "Invalid action. Please select 'A' to add to the queue, 'I' to install immediately, or 'B' to go back."
                ;;
        esac
    done
}

# Function to check and insert sourcing of .bash_aliases in .bashrc
check_and_insert_bashrc() {
    if [ -f "$HOME/.bashrc" ] && ! grep -q ". ~/.bash_aliases" "$HOME/.bashrc"; then
        echo "Appending '. ~/.bash_aliases' to .bashrc."
        echo ". ~/.bash_aliases" >> "$HOME/.bashrc"
    fi
}

# Function to install a single alias to .bash_aliases
install_alias() {
    alias_line="$1"
    if ! grep -q "$alias_line" "$HOME/.bash_aliases"; then
        echo "$alias_line" >> "$HOME/.bash_aliases"
        echo "Installed alias: $alias_line"
    else
        echo "Alias is already installed in .bash_aliases."
    fi
}

# Function to install all aliases in the queue
install_aliases_in_queue() {
    for alias_line in "${queue[@]}"; do
        install_alias "$alias_line"
    done
    # Clear the queue after installation
    queue=()
}

# Check if .bash_aliases exists in the home directory
if [ ! -f "$HOME/.bash_aliases" ]; then
    read -rp "The .bash_aliases file does not exist. Do you want to create it? (y/n): " create_file
    if [ "$create_file" = "y" ]; then
        touch "$HOME/.bash_aliases"
        echo "Created .bash_aliases file."

        # Check and insert sourcing .bash_aliases in .bashrc
        check_and_insert_bashrc
    else
        echo "Skipping alias insertion. You can manually create .bash_aliases and add aliases to it."
        exit
    fi
else
    # Check and insert sourcing .bash_aliases in .bashrc
    check_and_insert_bashrc
fi

# List of aliases
aliases=(
    "alias edalias='nano .bash_aliases'"
    "alias edbashrc='nano .bashrc'"
    "alias edfuncs='nano .bash_functions'"
    "alias refresh='exec bash'"
    "alias home='cd ~/'"
    "alias cls='clear'"
    "alias editrc='sudo nano .bashrc'"
    "alias editalias='nano ~/.bash_aliases'"
    "alias editfunc='nano ~/.bash_functions'"
    "alias del='rm'"
    "alias reboot='systemctl reboot -i'"
    "alias sudel='sudo rm -i'"
    "alias rd='rmdir -rf'"
    "alias surd='sudo rm -r'"
    "alias md='mkdir'"
    "alias mexec='chmod +x'"
    "alias sumd='sudo mkdir'"
    "alias sysinfo='inxi -Fxz'"
    "alias install='sudo nala install -y'"
    "alias upgradable='nala list --upgradable'"
    "alias purge='sudo nala purge'"
    "alias search='nala search'"
    "alias update='sudo nala update'"
    "alias upgrade='sudo nala update && sudo nala upgrade -y'"
    "alias snapi='sudo snap install'"
    "alias e='exit'"
)

# Initialize the queue
queue=()

# Main menu
previous_menu=""
while true; do
    clear
    echo "Choose an option:"
    echo "1. Browse aliases by category"
    echo "2. Browse all aliases"  # Updated option
    echo "3. View aliases in the queue"
    echo "q. Quit"
    read -rp "Your choice: " menu_choice

    case "$menu_choice" in
        1)
            previous_menu="main"
            clear
            echo "Choose a category:"
            echo "1. Edit config files"
            echo "2. Commandline shortcuts"
            echo "3. Application management"
            echo "B. Back to the previous menu"
            read -rp "Category choice (or any other key to go back): " category_choice

            if [ "$category_choice" = "B" ] || [ "$category_choice" = "b" ]; then
                continue
            fi

            display_aliases_by_category "$category_choice"
            
            read -rp "Enter the number of an alias to see an explanation, or 'B' to go back: " alias_choice

            if [ "$alias_choice" = "B" ] || [ "$alias_choice" = "b" ]; then
                if [ "$previous_menu" = "main" ]; then
                    continue
                elif [ "$previous_menu" = "category" ]; then
                    previous_menu="main"
                    continue
                fi
            fi

            alias_explanations "$alias_choice"
            previous_menu="category"
            ;;
        2)
            # Browse all aliases
            display_all_aliases
            read -rp "Enter the number of an alias to see an explanation or 'B' to go back to the main menu: " alias_choice

            if [ "$alias_choice" = "B" ] || [ "$alias_choice" = "b" ]; then
                continue
            fi

            alias_explanations "$alias_choice"
            ;;
        3)
            # View aliases in the queue
            clear
            echo "Aliases in the queue:"
            for i in "${!queue[@]}"; do
                echo "[$i] ${queue[$i]}"
            done
            read -rp "Do you want to install the aliases (I), empty the queue (E), or go back (B)? " queue_action

            case "$queue_action" in
                I|i)
                    install_aliases_in_queue  # Call the function to install aliases in the queue
                    queue=()  # Clear the queue after installation
                    ;;

                E|e)
                    # Empty the queue
                    queue=()
                    echo "Emptied the queue."
                    ;;
                B|b)
                    # Go back to the previous menu
                    continue
                    ;;
                *)
                    echo "Invalid action. Please select 'I' to install, 'E' to empty the queue, or 'B' to go back."
                    ;;
            esac
            ;;
        q|Q)
            exit
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            read -rp "Press Enter to continue..."
            ;;
    esac
done
