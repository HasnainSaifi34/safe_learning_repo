FROM python:3.6

# Install system dependencies including CMake
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    g++ \
    make \
    wget \
    cmake \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install pip tools and Jupyter
RUN pip install pip==20.0.1
RUN pip install --no-cache-dir setuptools==40.8.0
RUN pip install --no-cache-dir wheel==0.33.6

RUN pip install --no-cache-dir jupyter==1.0.0
RUN pip install --no-cache-dir notebook==5.7.8
RUN pip install --no-cache-dir ipywidgets==7.4.2


# Install scientific and optimization libraries
RUN pip install --no-cache-dir numpy==1.14.5
RUN pip install --no-cache-dir scipy==1.2.0
RUN pip install --no-cache-dir qdldl==0.1.5
RUN pip install --no-cache-dir osqp==0.6.1
RUN pip install --no-cache-dir ecos==2.0.7.post1
RUN pip install --no-cache-dir scs==2.1.0
RUN pip install --no-cache-dir cvxpy==1.1.12
RUN pip install --no-cache-dir multiprocess==0.70.11.1
RUN pip install --no-cache-dir six==1.12.0
RUN pip install --no-cache-dir fastcache==1.1.0
RUN pip install --no-cache-dir toolz==0.9.0
RUN pip install --no-cache-dir cython==0.29.14
RUN pip install --no-cache-dir matplotlib==2.2.3
RUN pip install --no-cache-dir pandas==0.25.3
RUN pip install --no-cache-dir scikit-learn==0.20.4
RUN pip install --no-cache-dir scikit-image==0.14.2
RUN pip install --no-cache-dir future==0.17.1
RUN pip install --no-cache-dir protobuf==3.19.0
RUN pip install --no-cache-dir grpcio==1.27.2
RUN pip install --no-cache-dir h5py==2.10.0
RUN pip install --no-cache-dir keras-preprocessing==1.1.2

# TensorFlow and TFP
RUN pip install --no-cache-dir tensorflow==1.15.0
RUN pip install --no-cache-dir tensorflow-probability==0.7.0

# Copy source code
COPY . .

# Set Python path
ENV PYTHONPATH "${PYTHONPATH}:/app:/app/gpflow-old-0.5:/app/safe_learning"

# Expose Jupyter port
EXPOSE 8888

# Default command
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
