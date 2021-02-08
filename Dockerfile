FROM lopsided/archlinux

MAINTAINER Jacob Gadikian <jacob.gadikian@tendermint.com>

RUN pacman -Syyu --noconfirm git namcap base-devel npm go

RUN useradd --create-home --comment "Arch Build User" build
ENV HOME /home/build

RUN mkdir /package
RUN chown build /package
WORKDIR /package

USER build

CMD ["makepkg", "--force"]
