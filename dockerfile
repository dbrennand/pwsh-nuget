FROM mcr.microsoft.com/powershell:ubuntu-18.04

# https://docs.microsoft.com/en-us/nuget/reference/nuget-exe-cli-reference
# Install Mono: https://www.mono-project.com/download/stable/#download-lin
RUN apt update && \
    apt install gnupg ca-certificates -y && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt update && apt install mono-devel -y

# Download the latest stable nuget.exe to /usr/local/bin
RUN curl -o /usr/local/bin/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe && \
    # Create as alias for nuget
    echo 'alias nuget="mono /usr/local/bin/nuget.exe"' >> ~/.bashrc
