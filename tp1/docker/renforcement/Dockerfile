FROM debian:11

# Configuration
ARG user=rl
ENV user=${user}

# mise à jour
RUN apt update && apt upgrade -y
RUN apt install -y python3 python3-pip python3-dev
# nécessaire pour box2d
RUN apt install -y swig

# utilisation d'un utilisateur différent de root
RUN groupadd -g 2000 $user && useradd -m -u 2001 -g $user $user
USER $user
WORKDIR /home/$user

# installation des library
RUN mkdir jupyter_conf
RUN mkdir notebooks
RUN python3 -m pip install -U pip
COPY requirements.txt requirements.txt
RUN python3 -m pip install --user -U -r requirements.txt
RUN pip3 install -U "jupyter-server<2.0.0"

# copy d'une config de jupyter permettant l'accès en dehors du container
COPY *.py "/home/$user/jupyter_conf" 

EXPOSE 8888
# lancement
# ARG jupyter_cmd="/home/$user/.local/bin/jupyter"
CMD [ ".local/bin/jupyter","notebook","--config","jupyter_conf/jupyter_notebook_config.py"] 
# CMD [ ".local/bin/jupyter-lab","--config","jupyter_conf/jupyter_jupyterlab_server_config.py" , "-ip","*" ] 

