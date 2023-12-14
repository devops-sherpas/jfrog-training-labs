from setuptools import setup

setup(
    name='demo',
    version='1.0',
    packages=[
        'jfrog_demo',
    ],
    license='LICENSE',
    install_requires=[
        "jinja2~=3.1.2",
        "pyyaml~=6.0"
    ]
)
