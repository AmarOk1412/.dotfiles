# .DOTFILES

# Just my .dotfiles

These .dotfiles are used (mainly) on a Dell XPS 9560 with Fedora 30 and
(minus ansible) a Thinkpad P51 with Ubuntu 19.04.

![](screenshots/20190519.png)

# Configured softwares

This repository contains my configurations for the following softwares:

+ i3
+ rofi
+ git
+ zsh

# Automate all the things

For now, ansible is used to install a new desktop from scratch. The roles
will install all the softwares I need, init all my projects repositories
and copy my important datas on the device.

This is the process I use to install a new device:

1. Install a new distribution manually
2. Mount my encrypted back-up to /tmp/decrypted_lutices
3. Manually copy my .ssh keys and add it to the agent
5. Then run
```bash
sudo dnf install git ansible
git clone http://github.com/AmarOk1412/.dotfiles
cd .dotfiles
ansible-playbook playbook.yml -K --extra-vars "ldap=<my_ldap>"
```
6. Drink maté

For the server:
```
ansible-playbook playbook_enconn.yml -u amarok -i hosts
```

# Lutices

Lutices is the name of my luks2 encrypted back-up.

This is the minimal internal structure of my back-ups:

```
.
├── .key
│   └── EEB2A9A9.key
├── .password-store
├── Pictures
│   ├── avatars
│   └── wallpapers
├── .ssh
├── .thunderbird
└── TODOLists
```

+ `.ssh` will populate `.ssh`
+ `.key` will populate gnupg2
+ `.password-store` will populate [pass](https://www.passwordstore.org/)
+ `.thunderbird` will populate `thunderbird`
+ The other directories contain my minimal datas.