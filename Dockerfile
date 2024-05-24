FROM --platform=linux/amd64 rocker/binder:4.4.0

USER root
ADD apt.txt apt.txt
RUN apt-get update --fix-missing > /dev/null \
        && xargs -a apt.txt apt-get install --yes \
        && apt-get clean > /dev/null \
        && rm -rf /var/lib/apt/lists/*
USER ${NB_USER}

ADD install.R install.R
RUN R -f install.R