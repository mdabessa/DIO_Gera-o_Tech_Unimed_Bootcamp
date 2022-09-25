from setuptools import setup, find_packages


with open('README.md', 'r') as f:
    page_description = f.read()

with open('requirements.txt', 'r') as f:
    requirements = f.read().splitlines()

setup(
    name='image_processing592',
    version='0.0.2',
    author='Matheus',
    description='Image Processing Package using Scikit-Image',
    long_description=page_description,
    long_description_content_type='text/markdown',
    packages=find_packages(),
    install_requires=requirements,
    python_requires='>=3.5',
)