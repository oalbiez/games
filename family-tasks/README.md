# Family Tasks


## Build

    docker run --rm --user `id -u`:`id -g` -it -v $(pwd):/data -w /data registry.gitlab.com/azae/outils/squib rake
