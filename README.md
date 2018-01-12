# Docker image for Grisbi

## Preamble

Grisbi http://grisbi.org/ is a GTK application. Doesn't run very well on macOS sierra, and doesn't work at all on macOS High Sierra, so I made a Docker image to run it.

## Requirements

Install XQuartz:

```
brew install xquartz
```

## Setup

Copy the following script in your shell startup file (mine is
`~/.zshrc`):

```
function grisbi() {
    open -a XQuartz
    ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    xhost + $ip
    docker run -u $(id -u) -ti --rm \
        -e DISPLAY=$ip:0 \
        -e HOME=/home \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v $HOME:/home \
        jbquenot/grisbi
}
```

Next: open a new shell and run `grisbi` on the terminal.  You're set!
