FROM tensorflow/tensorflow:2.1.0-gpu-py3-jupyter

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq \
 && apt-get install --no-install-recommends -y \
    # install essentials
    build-essential \
    wget \
    git \
    libssl-dev libffi-dev python3-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN /usr/bin/python3 -m pip install -U 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'
RUN /usr/bin/python3 -m pip install absl-py matplotlib numpy Pillow PyYAML six  tensorflow-addons lxml
ENV PYTHONPATH "${PYTHONPATH}:."

