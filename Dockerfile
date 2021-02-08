FROM lopsided/archlinux

MAINTAINER Jacob Gadikian <jacob.gadikian@tendermint.com>

RUN pacman -Syyu --noconfirm git namcap base-devel npm go && \
      useradd --create-home --comment "Arch Build User" build && \
      chmod 777 /etc/makepkg.conf 
      
ENV HOME /home/build

RUN mkdir /package
RUN chown build /package
WORKDIR /package

USER build

CMD ["makepkg", "--noconfirm"]
