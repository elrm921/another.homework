FROM ubuntu:18.04

ARG compiler
RUN mkdir /source
RUN mkdir /program
COPY ./main.cpp /source
COPY ./launch.sh /program
RUN apt-get update && apt-get install -y g++ clang
RUN g++ -Wall -pthread -std=c++17 /source/main.cpp -o /program/vgcc
RUN clang++ -Wall -pthread -std=c++17 /source/main.cpp -o /program/vclang
RUN chmod +x /program/launch.sh
CMD ["/program/launch.sh"]