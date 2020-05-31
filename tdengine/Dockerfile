FROM debian:buster-slim AS builder

# Install needed dependencies
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install git build-essential cmake

# Clone and build TDengine binary and lib
RUN git clone https://github.com/taosdata/TDengine.git \
    && mkdir build \
    && cd build \
    && cmake ../TDengine \
    && cmake --build .

FROM debian:buster-slim

# Set workdir
WORKDIR /app

# Add TDenngine config and log dir
ADD ./taos.cfg /app
RUN mkdir -p /data/log
ADD ./entrypoint.sh /app
ADD ./start.sh /app
ADD ./db_create.sql /app

# Copy binary and lib from builder
COPY --from=builder /build/build/bin/* /usr/local/bin/
COPY --from=builder /build/build/lib/libtaos.so.2.0.0.0 /usr/local/lib/

# Create missing symbolic links
RUN cd /usr/local/lib/ \
    && ln -s libtaos.so.2.0.0.0 libtaos.so.1 \
    && ln -s libtaos.so.1 libtaos.so

# Update path to TDengine library
ENV LD_LIBRARY_PATH /usr/local/lib/$LD_LIBRARY_PATH

# Create DB
ENTRYPOINT ["./entrypoint.sh"]

# Run TDengind DB
CMD ["./start.sh"]
