(($+commands[docker])) || return 0

verbose Setting up $fg[red]docker$reset_color aliases

alias dstats='docker stats $(docker ps --format={{.Names}})'
alias dpull='docker images --format="{{.Repository}}:{{.Tag}}" | command grep -v ":<none>" | xargs --no-run-if-empty --max-lines=1 docker pull'
alias dclean='docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi'

if [[ $OSTYPE == darwin* ]]; then
  alias moby='docker run --rm -it --privileged --pid=host walkerlee/nsenter -t 1 -m -u -i -n sh'
fi
