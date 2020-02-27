FROM ubuntu:bionic

# This image only works with ROCKY kolla images

# Why some packages are needed:
# - apt: --no-install-recommends - omitted else kolla-ansible fails to install
# - apt: python-subprocess32 - python-openstack wont install otherwise - https://github.com/google/python-subprocess32/issues/38

RUN mkdir -p \
      /root/.ssh \
      /etc/kolla \
  && apt-get update \
  && apt-get install -y \
      ansible \
      git \
      iputils-ping \
      net-tools \
      openssh-client \
      python2.7 \
      python-dev \
      python-pip \
      python-setuptools \
      python-subprocess32 \
  && rm -rf /var/lib/apt/lists/* \
  && python -m pip install --no-cache-dir \
      netaddr \
      pyOpenSSL \
      python-openstackclient \
      python-neutronclient \
  && git clone \
      --single-branch --branch stable/rocky \
      https://github.com/openstack/kolla-ansible.git /var/repos/kolla-ansible \
  && pip install /var/repos/kolla-ansible

COPY image-files/ /
