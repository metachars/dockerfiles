FROM ubuntu:18.04
LABEL maintainer="dongbeiouba@gmail.com"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y binutils
RUN apt-get install -y sudo python2.7 python-pip python-dev git gcc gcc-multilib gdb vim ruby gem zsh wget nmap netcat

# install pwndbg
RUN git clone https://github.com/pwndbg/pwndbg.git ~/.pwndbg && \
    cd ~/.pwndbg && \
    ./setup.sh

# Install pwntools
RUN pip install pwntools

# Install ROPgadget
RUN pip install ropgadget

# Install one_gadget
RUN gem install one_gadget

# Install angelboy peda
RUN git clone https://github.com/scwuaptx/peda.git ~/.peda
RUN echo "source ~/.peda/peda.py" >> ~/.gdbinit
RUN cp ~/.peda/.inputrc ~/


# Install angelboy Pwngdb
RUN git clone https://github.com/scwuaptx/Pwngdb.git ~/.Pwngdb
RUN cp ~/.Pwngdb/.gdbinit ~/

# Modify .gdbinit
RUN sed -i 's/~\/peda/~\/.peda/g' ~/.gdbinit 
RUN sed -i 's/~\/Pwngdb/~\/.Pwngdb/g' ~/.gdbinit

# Install oh-my-zsh
ENV TERM xterm
ENV ZSH_THEME agnoster
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

WORKDIR /root

CMD ["zsh"]
