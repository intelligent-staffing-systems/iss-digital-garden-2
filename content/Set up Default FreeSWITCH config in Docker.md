---
title: Set up FreeSWITCH in Docker
---

- [ ] [[Set up the containerized freeswitch server]]
- [ ] [[Set up testing config in a compose setting]]

## Downloading proprietary packages
Utilizing [this documentation](https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Installation/Linux/Debian_67240088/#building-from-source)
create an account at signalwire.com
The ISS account is found at: https://intelligent-staffing-systems.signalwire.com/
Make a PAT, and copy it to your ~/.bashrc.  
```
export SIGNALWIRE_TOKEN=pat_token_here
```

start a new shell. 
Then, in a project directory, such as ~/projects/freeswitch-server, run:
```bash
docker run --rm -v ${PWD}:/freeswitch -w /freeswitch -e TOKEN=$SIGNALWIRE_TOKEN debian:bullseye \
  bash -c "
    set -e
    apt-get update && apt-get install -yq gnupg2 wget lsb-release git
    wget --http-user=signalwire --http-password=\$TOKEN -O /usr/share/keyrings/signalwire-freeswitch-repo.gpg https://freeswitch.signalwire.com/repo/deb/debian-release/signalwire-freeswitch-repo.gpg
    echo 'machine freeswitch.signalwire.com login signalwire password '\$TOKEN > /etc/apt/auth.conf
    chmod 600 /etc/apt/auth.conf
    echo 'deb [signed-by=/usr/share/keyrings/signalwire-freeswitch-repo.gpg] https://freeswitch.signalwire.com/repo/deb/debian-release/ '\$(lsb_release -sc)' main' > /etc/apt/sources.list.d/freeswitch.list
    echo 'deb-src [signed-by=/usr/share/keyrings/signalwire-freeswitch-repo.gpg] https://freeswitch.signalwire.com/repo/deb/debian-release/ '\$(lsb_release -sc)' main' >> /etc/apt/sources.list.d/freeswitch.list
    apt-get update
    apt-get build-dep -y freeswitch
    git clone https://github.com/signalwire/freeswitch.git -b v1.10 freeswitch-src
    cd freeswitch-src
    git config pull.rebase true
    ./bootstrap.sh -j
    ./configure
    make
    make install
    cd ..
    cp -R /usr/local/freeswitch ./
    chown -R $(id -u):$(id -g) freeswitch freeswitch-src
  "
```

[[important outputs from docker install freeswitch command]]

 Consider the [follow up documentation](https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Installation/Linux/Deprecated-Installation-Instructions/Debian-Post-Install-Tasks_13172868#about)

After the above, we are left in our freeswitch-server the following directories:
```
~/freeswitch-server
$ ls
freeswitch  freeswitch-src
```

which expand into the following filetree:
```
~/freeswitch-server
$ tree -L 2
.
├── freeswitch
│   ├── bin
│   ├── conf
│   ├── db
│   ├── fonts
│   ├── grammar
│   ├── htdocs
│   ├── images
│   ├── include
│   ├── lib
│   ├── log
│   ├── mod
│   ├── recordings
│   ├── run
│   └── scripts
└── freeswitch-src
    ├── acinclude.m4
    ├── aclocal.m4
    ├── AUTHORS
    ├── bootstrap.sh
    ├── build
    ├── cc.sh
    ├── ChangeLog
    ├── clients
    ├── cluecon2_small.tmpl
    ├── cluecon2.tmpl
    ├── cluecon_small.tmpl
    ├── cluecon.tmpl
    ├── cmake_modules
    ├── conf
    ├── config.log
    ├── config.status
    ├── configure
    ├── configure.ac
    ├── COPYING
    ├── debian
    ├── devel-bootstrap.sh
    ├── docker
    ├── docs
    ├── dtd
    ├── fonts
    ├── freeswitch
    ├── Freeswitch.2017.sln
    ├── Freeswitch.2017.sln.bat
    ├── freeswitch-config-rayo.spec
    ├── freeswitch-sounds-en-ca-june.spec
    ├── freeswitch-sounds-en-us-allison.spec
    ├── freeswitch-sounds-en-us-callie.spec
    ├── freeswitch-sounds-fr-ca-june.spec
    ├── freeswitch-sounds-music.spec
    ├── freeswitch-sounds-pt-BR-karina.spec
    ├── freeswitch-sounds-ru-RU-elena.spec
    ├── freeswitch-sounds-sv-se-jakob.spec
    ├── freeswitch.spec
    ├── fs_cli
    ├── fscomm
    ├── fs_encode
    ├── fs_ivrd
    ├── fs_tts
    ├── htdocs
    ├── images
    ├── INSTALL
    ├── libfreeswitch.la
    ├── libfreeswitch_libyuv.la
    ├── libs
    ├── libtool
    ├── LICENSE
    ├── Makefile
    ├── Makefile.am
    ├── Makefile.in
    ├── modules.conf
    ├── msbuild.cmd
    ├── NEWS
    ├── README
    ├── README.md
    ├── scripts
    ├── SECURITY.md
    ├── src
    ├── support-d
    ├── swig_common.i
    ├── tests
    ├── tone2wav
    ├── w32
    ├── web
    └── yum

37 directories, 49 files
```

## Complete Containerization - Full Stack Preparation
We are now ready to create a dockerfile and to add freeswitch to it's own docker compose, in preparation to adding it to our fullstack docker-compose, we want to first ensure freeswitch is working as we need.
We will then start the server and run some functionality tests before we try and connect it to our RoR backend and NextJS frontend.  

First, let's make a dockerfile that assumes the filetree is set up, and that it is in the root of the repo (where both the freeswitch and freeswitch-src directories live) and successfully starts up freeswitch. 
A

## Initiate call via Frontend to a client 

### Desired modules 
check out the build/modules.conf.in

## Save a CDR record to Postgres
Now we will get a CDR record into a PostGres database, and will consider initial integration complete.  

