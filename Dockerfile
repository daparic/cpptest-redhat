FROM registry.access.redhat.com/ubi8/ubi:latest
MAINTAINER dexter

RUN groupadd -r parasoft && useradd -m -r -g parasoft parasoft && \
    yum update && yum install -y gcc gcc-c++ cmake autoconf && \
    mkdir /opt/parasoft && chown parasoft:parasoft /opt/parasoft/

USER parasoft
COPY --chown=parasoft:parasoft stan_chunks /tmp/stan_chunks
COPY --chown=parasoft:parasoft prof_chunks /tmp/prof_chunks

RUN mkdir /opt/parasoft/cpptest-standard /opt/parasoft/cpptest-professional && \
    cat /tmp/stan_chunks/* > /tmp/cpptest-stan.tar.gz && \
    cat /tmp/prof_chunks/* > /tmp/cpptest-prof.tar.gz && \
    tar xvzpf /tmp/cpptest-stan.tar.gz -C /opt/parasoft/cpptest-standard && \
    tar xvzpf /tmp/cpptest-prof.tar.gz -C /opt/parasoft/cpptest-professional && \
    rm -rf /tmp/cpptest-stan.tar.gz /tmp/stan_chunks/ /tmp/cpptest-prof.tar.gz /tmp/prof_chunks/
