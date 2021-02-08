FROM lopsided/archlinux

MAINTAINER Jacob Gadikian <jacob.gadikian@tendermint.com>

RUN pacman --sync --refresh --sysupgrade --noconfirm --noprogressbar --quiet && \
  pacman -Syyu --noconfirm git namcap base-devel

RUN useradd --create-home --comment "Arch Build User" build
ENV HOME /home/build

RUN mkdir /package
RUN chown build /package
WORKDIR /package

USER build

CMD ["makepkg", "--force"]
