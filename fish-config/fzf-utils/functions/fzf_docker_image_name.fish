function fzf_docker_image_name --description 'Use fzf to find the docker image name'
  docker images --format "table {{.Repository}}\t{{.Tag}}" | fzf --header-lines=1 | awk '{print $1 ":" $2}'
end
