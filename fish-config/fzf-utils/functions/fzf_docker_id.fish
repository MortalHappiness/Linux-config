function fzf_docker_id --description 'Use fzf to find the docker container id'
  docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}" | fzf --header-lines=1 | awk '{print $1}'
end
