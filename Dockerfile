FROM haxqer/confluence:10.0.2

# ставим Temurin JRE 21 и делаем его системным java
RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates gnupg \
 && mkdir -p /opt/java \
 && wget -qO- https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.4%2B7/OpenJDK21U-jre_x64_linux_hotspot_21.0.4_7.tar.gz \
    | tar xz -C /opt/java \
 && ln -s /opt/java/jdk-21*/ /opt/java/jre21 \
 && update-alternatives --install /usr/bin/java java /opt/java/jre21/bin/java 20000 \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/opt/java/jre21
