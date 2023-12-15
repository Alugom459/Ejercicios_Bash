FROM ubuntu:jammy
RUN apt update && apt install nano -y
RUN groupadd -g 30025 "domain_users"
RUN useradd -m -u 30016 -g 30025 alu10187459
USER alu10187459
WORKDIR /home/alu10187459/
CMD ["/bin/bash"]
