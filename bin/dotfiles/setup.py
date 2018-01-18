from setuptools import setup

setup(
    name='click-dotfile',
    version='1.0',
    py_modules=['dotfile'],
    include_package_data=True,
    install_requires=[
        'click',
    ],
    entry_points='''
        [console_scripts]
        dotfile=dotfile:cli
    ''',
)
