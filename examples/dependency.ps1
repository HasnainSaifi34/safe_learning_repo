# Create a new environment with Python 3.6
conda create -n safe_learning python=3.6 -y

# Activate the environment
conda activate safe_learning

# Install dependencies
pip install pip==18.1
pip install numpy==1.14.5
pip install tensorflow==1.14.0
pip install matplotlib scipy jupyter

# Install GPflow 0.4.0
pip install git+https://github.com/GPflow/GPflow.git@0.4.0

# Install the package itself
pip install -e .